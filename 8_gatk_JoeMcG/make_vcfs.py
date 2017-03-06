import subprocess, os, glob


files=glob.glob('./*.bam')

last=len(files)
count =1
#aliaspart='alias java_jre="/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin/java"; java_jre -version'
#subprocess.call(['alias', alias], shell=True)
ref='/home/jmcgill/Desktop/biocompute/human_g1k_v37.fasta'
subprocess.call(['samtools','faidx',ref])
subprocess.call(['java', '-jar','/home/jmcgill/picard/picard.jar', 'CreateSequenceDictionary', 'R=', ref, 'O=', '/home/jmcgill/Desktop/biocompute/human_g1k_v37.dict'])
for f in files:
	seqname=f.split('_')[0][2:]
	print seqname
	'''
	myfile='/Volumes/joseph.mcgill/HLA-UCLA/Joe/bamfiles/Joe_pipeline_output/vcf_files/'+ seqname+ '_lofreq.vcf'
	print os.path.isfile(myfile)
	if os.path.isfile(myfile)==False:
	'''
	
	outfile=seqname+ '_sorted'
	
	subprocess.call(['samtools', 'sort',  f  ,outfile])
	print 'BAM file sorted'
	outfile1='I='+outfile+'.bam'
	outfile2='O=new_'+seqname+'_mark_duplicates.bam'
	
	outfile3 = 'new_'+seqname + '_mark_duplicates.bam'
	
	outfile4 = 'I='+ outfile3
	outfile5 = 'O=with_header_'+ outfile3

	outfile6 = 'with_header_'+outfile3

	txtfile='M='+seqname+'.txt'
	subprocess.call(['java', '-jar', '/home/jmcgill/picard/picard.jar', 'MarkDuplicates', outfile1, outfile2, txtfile, 'REMOVE_DUPLICATES=F'])
	print 'Duplicates Marked'
	subprocess.call(['samtools','index',outfile3])
	print outfile3 + ' indexed'
	subprocess.call(['java','-jar', '/home/jmcgill/picard/picard.jar','AddOrReplaceReadGroups',outfile4,outfile5,'RGLB=lib1','RGPL=Illumina','RGPU=unit1','RGSM=20'])
	subprocess.call(['samtools','index',outfile6])
	subprocess.call(['java', '-jar', '/home/jmcgill/picard/GenomeAnalysisTK.jar', '-T', 'RealignerTargetCreator', '-R', ref, '-I', outfile6, '-o', 'realigned'+seqname+'.list','-nt','22'])
	print 'Targets Realigned'

	subprocess.call(['java', '-jar', '/home/jmcgill/picard/GenomeAnalysisTK.jar', '-T', 'IndelRealigner', '-R',ref, '-I', outfile6, '-targetIntervals', 'realigned'+seqname+'.list', '-o', seqname+'_realigned_reads.bam'])
	print 'Indels Realigned'
	
	subprocess.call(['java', '-jar', '/home/jmcgill/picard/GenomeAnalysisTK.jar', '-T', 'HaplotypeCaller', '-R', ref, '-I', seqname+'_realigned_reads.bam', '-L', 'X', '-o', seqname+'_gatk_raw_snps.vcf'])
	print 'Variants Called'

	#subprocess.call(['java', '-jar', '/home/jmcgill/picard/GenomeAnalysisTK-3.6/GenomeAnalysisTK.jar', '-T', 'VariantFiltration', '-V', seqname+'_gatk_raw_snps.vcf', '--filterExpression', '"QD', '<', '2.0', '||', 'FS', '>', '60.0', '||', 'MQ', '<', '40.0', '||', 'MQRankSum', '<', '-12.5', '||', 'ReadPosRankSum', '<', '-8.0"', '--filterName', '"my_snp_filter"', '-o', seqname+'filtered_snps.vcf' ])
	#print 'variants filtered'

	print '%d of %d:'%(count, last)
	count +=1
