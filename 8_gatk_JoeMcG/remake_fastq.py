from subprocess import Popen
from multiprocessing.pool import ThreadPool
import sys,os,time, glob, subprocess

files=glob.glob('/Volumes/joseph.mcgill/HLA-UCLA/Joe/bamfiles/*.bam')

#newfile=[n.split('/')[-1] for n in files]
#cmds=['/usr/bin/bedtools2/bin/bedtools genomecov -d -ibam '+f+' > /Volumes/joseph.mcgill/HLA-UCLA/Joe/bamfiles/bed_files/'+f.split('/')[-1]+'.bed.cov' for f in files ]

#print cmds[0]
#print cmds[:2]
#print cmds[1:]

for f in files:
	subprocess.call('bedtools bamtofastq -i '+f+' -fq ./fastqs/'+f.split('/')[-1]+'.fastq', shell=True, stdout=subprocess.PIPE)

print files[1].split('/')[-1]	