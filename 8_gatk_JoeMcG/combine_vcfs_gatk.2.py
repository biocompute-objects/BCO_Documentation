import pandas as pd
import glob, subprocess,os,math



files=sorted(glob.glob('*snps.vcf'))
#print files

seqnames=[i.split('_')[0] for i in files]
#for f in files:
	#print f
	#nfilename=f.split('_')[0]+'_for_anno_var.vcf'
	#nfile=[]
	#nfile.append(nfilename)
	#commandlist=['perl','/Users/joseph.mcgill/libraries/annovar/convert2annovar.pl','-format', 'vcf4',f,'-outfile',nfilename]
	#print ' '.join(commandlist)
	#os.system(' '.join(commandlist))


colnames=[i.split('_')[0] for i in files]
colnames=["Reference","Alternate"]+colnames

rownames=[]

for f in seqnames:
	infile=open(f+'_for_anno_var.vcf')
	subj=f.split('_')[0]
	lines=infile.readlines()
	lines=[i.split() for i in lines if i.startswith('X')]
	for i in lines:
		if int(i[1]) in rownames:
			z=0
		else:
			rownames.append(int(i[1]))

df=pd.DataFrame(index=sorted(rownames),columns=colnames)


for f in seqnames:
	infile=open(f+'_for_anno_var.vcf.variant_function').readlines()
	for l in infile:
		#print l
		pos=int(l.split()[3])
		#print pos
		
		#if math.isnan(df.ix[pos,'Reference']) or df.ix[pos,'Reference'] != l.split()[3]:
		df.ix[pos,'Reference'] = l.split()[3]
		#else:
		#	print 'diff refs'
		#if math.isnan(df.ix[pos,'Alternate']) or df.ix[pos,'Alternate'] != l.split()[4]:
		df.ix[pos,'Alternate'] = l.split()[4]
		#else:
		#	print 'diff refs'
		df.ix[pos,f]=l.split()[6]
df.to_csv('summary.csv')
