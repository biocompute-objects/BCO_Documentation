import re
import datetime
import os, hashlib, time, base64, string
import Cookie
import json
import bcrypt
import util
import traceback


def make_hash_string():
    m = hashlib.md5()
    m.update(str(time.time()))
    m.update(str(os.urandom(64)))
    
    return string.replace(base64.encodestring(m.digest())[:-3], '/', '$')



def login(mongo_cl_users, in_json, session_life, log_dir):
   
    try:
        
        login_user = mongo_cl_users.find_one({'email' : in_json["email"]})
        
        out_json = {}
        if login_user:
            stored_password = login_user['password'].encode('utf-8')
            submitted_password = in_json['password'].encode('utf-8')
            if bcrypt.hashpw(submitted_password, stored_password) == stored_password:
                c = Cookie.SimpleCookie()
                session_id = make_hash_string() + make_hash_string()
                c['sessionid']= session_id
                c['email']= in_json["email"]
                c['sessionid']['expires'] = session_life
                email = in_json["email"]
                msg = "Signed in as " + email
                out_json = {"status":1, "email":email, "sessionid":session_id}
                if login_user["status"] == 0:
                    out_json = {"status":0, "errormsg":"Looks like your account has not been activated yet!"}
            else:
                out_json = {"status":0, "errormsg":"Login failed! Invalid email/password combination"}
        else:
            out_json = {"status":0, "errormsg":"Login failed! Invalid email/password combination"}
    except Exception, e:
        out_json = util.log_error(traceback.format_exc(), log_dir)

    return out_json



def authenticate(log_dir):

    out_json = {}
    try:
        if 'HTTP_COOKIE' in os.environ:
            string = os.environ.get('HTTP_COOKIE')
            c = Cookie.SimpleCookie()
            c.load(string)
            if 'sessionid' in c:
                session_id = c['sessionid'].value
                email = c['email'].value
                msg = "Signed in as " + email
                out_json = {"status":1, "email":email, "sessionid":session_id}
            else:
                out_json =  {"status":0, "errormsg": "session ID not in cookie"}
        else:
            out_json =  {"status":0, "errormsg": "No cookie found!"}
    except Exception, e:
        out_json = util.log_error(traceback.format_exc(), log_dir)

    return out_json




