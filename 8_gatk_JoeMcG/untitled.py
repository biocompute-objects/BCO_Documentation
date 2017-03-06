import subprocess, os, glob
txtlist = []
outlst  = []
outlst1 = []
outlst2 = []
outlst3 = []
outlst4 = []
outlst5 = []
outlst6 = []
seqlist = []

files=glob.glob('./*.bam')
for f in files:
    print '"'+f+'",'
    seqname=f.split('_')[0][2:]
    seqlist.append(seqname)
    
    outfile  = seqname+'_sorted'
    outlst.append(outfile)
    
    outfile1 = 'I='+outfile+'.bam'
    outlst1.append(outfile1)

    outfile2 = 'O=new_'+seqname+'_mark_duplicates.bam'
    outlst2.append(outfile2)

    outfile3 = 'new_'+seqname + '_mark_duplicates.bam'
    outlst3.append(outfile3)    
    
    outfile4 = 'I='+ outfile3
    outlst4.append(outfile4)
    
    outfile5 = 'O=with_header_'+ outfile3
    outlst5.append(outfile5)
    
    outfile6 = 'with_header_'+outfile3
    outlst6.append(outfile6)
    
    txtfile  = 'M='+seqname+'.txt'
    txtlist.append(txtfile)
    
# print "picard_GenomeAnalysisTK: \n    input:"
# for i in outlst6:
#     print '        "'+i+'-targetIntervals",'
# for i in seqlist:
#     print '        "realigned'+i+'.list",'
# print "    output:"
# for i in seqlist:
#     print '        "'+i+'_gatk_raw_snps.vcf",'
# for i in txtlist:
#     print '        "'+i.split('=')[1]+'",'
    
    
#print txtlist, outlst, outlst1, outlst2, outlst3, outlst4, outlst5, outlst6