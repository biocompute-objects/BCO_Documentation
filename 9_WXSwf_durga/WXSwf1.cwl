{
  "class": "Workflow",
  "steps": [
    {
      "id": "#SBG_FASTA_Indices",
      "run": {
        "stdin": "",
        "sbg:modifiedBy": "Durga",
        "outputs": [
          {
            "outputBinding": {
              "sbg:inheritMetadataFrom": "#reference",
              "glob": {
                "class": "Expression",
                "script": "{\n  return $job.inputs.reference.path.split(\"/\").pop()\n}",
                "engine": "#cwl-js-engine"
              },
              "secondaryFiles": [
                ".fai",
                "^.dict"
              ]
            },
            "type": [
              "null",
              "File"
            ],
            "sbg:fileTypes": "FASTA",
            "label": "Reference",
            "id": "#fasta_reference"
          },
          {
            "outputBinding": {
              "sbg:metadata": {},
              "glob": "*.fai"
            },
            "type": [
              "null",
              "File"
            ],
            "sbg:fileTypes": "FAI",
            "label": "FASTA Index",
            "id": "#fasta_index"
          },
          {
            "outputBinding": {
              "sbg:metadata": {},
              "glob": "*.dict"
            },
            "type": [
              "null",
              "File"
            ],
            "sbg:fileTypes": "DICT",
            "label": "FASTA Dictionary",
            "id": "#fasta_dict"
          }
        ],
        "temporaryFailCodes": [],
        "sbg:toolkit": "SBGTools",
        "appUrl": "/u/Durga/exome-sequencing/apps/#Durga/exome-sequencing/sbg-fasta-indices/0",
        "sbg:createdOn": 1477591294,
        "stdout": "",
        "sbg:project": "Durga/exome-sequencing",
        "sbg:revision": 0,
        "sbg:license": "Apache License 2.0",
        "requirements": [
          {
            "requirements": [
              {
                "dockerPull": "rabix/js-engine",
                "class": "DockerRequirement"
              }
            ],
            "class": "ExpressionEngineRequirement",
            "id": "#cwl-js-engine"
          }
        ],
        "sbg:job": {
          "allocatedResources": {
            "cpu": 1,
            "mem": 2500
          },
          "inputs": {
            "reference": {
              "size": 0,
              "class": "File",
              "secondaryFiles": [],
              "path": "/path/to/reference.ext"
            }
          }
        },
        "class": "CommandLineTool",
        "x": 366,
        "sbg:cmdPreview": "python /opt/sbg-fasta-indices.py --REFERENCE /path/to/reference.ext  --dict  --fai",
        "sbg:validationErrors": [],
        "sbg:toolAuthor": "Sanja Mijalkovic, Seven Bridges Genomics, <sanja.mijalkovic@sbgenomics.com>",
        "sbg:revisionsInfo": [
          {
            "sbg:modifiedBy": "Durga",
            "sbg:revisionNotes": "Copy of admin/sbg-public-data/sbg-fasta-indices/4",
            "sbg:modifiedOn": 1477591294,
            "sbg:revision": 0
          }
        ],
        "baseCommand": [
          "python",
          "/opt/sbg-fasta-indices.py"
        ],
        "label": "SBG FASTA Indices",
        "sbg:contributors": [
          "Durga"
        ],
        "sbg:copyOf": "admin/sbg-public-data/sbg-fasta-indices/4",
        "id": "Durga/exome-sequencing/sbg-fasta-indices/0",
        "sbg:id": "Durga/exome-sequencing/sbg-fasta-indices/0",
        "inputs": [
          {
            "label": "FASTA file",
            "required": true,
            "id": "#reference",
            "type": [
              "File"
            ],
            "description": "FASTA file to be indexed",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--REFERENCE"
            },
            "sbg:stageInput": "link"
          }
        ],
        "arguments": [
          {
            "separate": true,
            "valueFrom": "--dict"
          },
          {
            "separate": true,
            "valueFrom": "--fai"
          }
        ],
        "sbg:latestRevision": 0,
        "hints": [
          {
            "dockerPull": "images.sbgenomics.com/djordje_klisic/sbg-fasta-indices:1.0",
            "class": "DockerRequirement",
            "dockerImageId": "b177f5bd06db"
          },
          {
            "class": "sbg:CPURequirement",
            "value": 1
          },
          {
            "class": "sbg:MemRequirement",
            "value": 2500
          }
        ],
        "sbg:image_url": null,
        "description": "Tool allows creating FASTA dictionary and index simultaneously which is necessary for running GATK tools. This version of tool for indexing uses SAMtools faidx command (toolkit version0.1.19), while for the FASTA dictionary is used Picard CreateFastaDictionary (toolkit version 1.140)",
        "sbg:sbgMaintained": false,
        "sbg:createdBy": "Durga",
        "successCodes": [],
        "sbg:revisionNotes": "Copy of admin/sbg-public-data/sbg-fasta-indices/4",
        "sbg:categories": [
          "Indexing"
        ],
        "y": 77.79296875,
        "sbg:modifiedOn": 1477591294
      },
      "inputs": [
        {
          "id": "#SBG_FASTA_Indices.reference",
          "source": [
            "#reference"
          ]
        }
      ],
      "outputs": [
        {
          "id": "#SBG_FASTA_Indices.fasta_reference"
        },
        {
          "id": "#SBG_FASTA_Indices.fasta_index"
        },
        {
          "id": "#SBG_FASTA_Indices.fasta_dict"
        }
      ],
      "sbg:x": 366,
      "sbg:y": 77.79296875
    },
    {
      "id": "#BWA_INDEX",
      "run": {
        "stdin": "",
        "sbg:modifiedBy": "Durga",
        "outputs": [
          {
            "label": "TARed fasta with its BWA indices",
            "outputBinding": {
              "sbg:inheritMetadataFrom": "#reference",
              "glob": {
                "class": "Expression",
                "script": "{\n  reference_file = $job.inputs.reference.path.split('/')[$job.inputs.reference.path.split('/').length-1]\n  ext = reference_file.split('.')[reference_file.split('.').length-1]\n  if(ext=='tar'){\n    return reference_file\n  }\n  else{\n    return reference_file + '.tar'\n  }\n}\n",
                "engine": "#cwl-js-engine"
              }
            },
            "id": "#indexed_reference",
            "type": [
              "null",
              "File"
            ],
            "sbg:fileTypes": "TAR",
            "description": "TARed fasta with its BWA indices."
          }
        ],
        "temporaryFailCodes": [],
        "inputs": [
          {
            "sbg:category": "Configuration",
            "type": [
              "null",
              "int"
            ],
            "description": "Total memory [GB] to be reserved for the tool (Default value is 1.5 x size_of_the_reference).",
            "label": "Total memory [Gb]",
            "id": "#total_memory"
          },
          {
            "label": "Reference",
            "type": [
              "File"
            ],
            "required": true,
            "id": "#reference",
            "sbg:category": "File input",
            "description": "Input reference fasta of TAR file with reference and indices.",
            "sbg:stageInput": "link",
            "sbg:fileTypes": "FASTA,FA,FA.GZ,FASTA.GZ,TAR"
          },
          {
            "sbg:category": "Configuration",
            "type": [
              "null",
              "string"
            ],
            "description": "Prefix of the index [same as fasta name].",
            "label": "Prefix of the index to be output",
            "id": "#prefix_of_the_index_to_be_output"
          },
          {
            "sbg:toolDefaultValue": "auto",
            "label": "Bwt construction",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-a"
            },
            "sbg:category": "Configuration",
            "description": "Algorithm for constructing BWT index. Available options are:s\tIS linear-time algorithm for constructing suffix array. It requires 5.37N memory where N is the size of the database. IS is moderately fast, but does not work with database larger than 2GB. IS is the default algorithm due to its simplicity. The current codes for IS algorithm are reimplemented by Yuta Mori. bwtsw\tAlgorithm implemented in BWT-SW. This method works with the whole human genome. Warning: `-a bwtsw' does not work for short genomes, while `-a is' and `-a div' do not work not for long genomes.",
            "id": "#bwt_construction",
            "type": [
              "null",
              {
                "type": "enum",
                "symbols": [
                  "bwtsw",
                  "is",
                  "div"
                ],
                "name": "bwt_construction"
              }
            ]
          },
          {
            "sbg:toolDefaultValue": "10000000",
            "label": "Block size",
            "id": "#block_size",
            "sbg:category": "Configuration",
            "description": "Block size for the bwtsw algorithm (effective with -a bwtsw).",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:category": "Configuration",
            "type": [
              "null",
              "boolean"
            ],
            "description": "Index files named as <in.fasta>64 instead of <in.fasta>.*.",
            "label": "Output index files renamed by adding 64",
            "id": "#add_64_to_fasta_name"
          }
        ],
        "sbg:toolkit": "BWA",
        "description": "BWA INDEX constructs the FM-index (Full-text index in Minute space) for the reference genome.\nGenerated index files will be used with BWA MEM, BWA ALN, BWA SAMPE and BWA SAMSE tools.\n\nIf input reference file has TAR extension it is assumed that BWA indices came together with it. BWA INDEX will only pass that TAR to the output. If input is not TAR, the creation of BWA indices and its packing in TAR file (together with the reference) will be performed.",
        "sbg:createdOn": 1477014219,
        "sbg:toolkitVersion": "0.7.13",
        "stdout": "",
        "sbg:project": "Durga/exome-sequencing",
        "sbg:revision": 0,
        "sbg:license": "GNU Affero General Public License v3.0, MIT License",
        "sbg:job": {
          "allocatedResources": {
            "cpu": 1,
            "mem": 1536
          },
          "inputs": {
            "reference": {
              "size": 0,
              "class": "File",
              "secondaryFiles": [
                {
                  "path": ".amb"
                },
                {
                  "path": ".ann"
                },
                {
                  "path": ".bwt"
                },
                {
                  "path": ".pac"
                },
                {
                  "path": ".sa"
                }
              ],
              "path": "/path/to/the/reference.fasta"
            },
            "block_size": 0,
            "add_64_to_fasta_name": true,
            "prefix_of_the_index_to_be_output": "prefix",
            "bwt_construction": "bwtsw",
            "total_memory": null
          }
        },
        "x": 178.66664632161462,
        "class": "CommandLineTool",
        "sbg:cmdPreview": "/opt/bwa-0.7.13/bwa index reference.fasta   -a bwtsw      -6    ; tar -cf reference.fasta.tar reference.fasta *.amb *.ann *.bwt *.pac *.sa",
        "sbg:validationErrors": [],
        "sbg:toolAuthor": "Heng Li",
        "sbg:revisionsInfo": [
          {
            "sbg:modifiedBy": "Durga",
            "sbg:revisionNotes": "Copy of admin/sbg-public-data/bwa-index/15",
            "sbg:modifiedOn": 1477014219,
            "sbg:revision": 0
          }
        ],
        "baseCommand": [
          {
            "class": "Expression",
            "script": "{\n  reference_file = $job.inputs.reference.path.split('/')[$job.inputs.reference.path.split('/').length-1]\n  ext = reference_file.split('.')[reference_file.split('.').length-1]\n  if(ext=='tar'){\n    return 'echo Index files passed without any processing!'\n  }\n  else{\n    index_cmd = '/opt/bwa-0.7.13/bwa index '+ reference_file + ' '\n    return index_cmd\n  }\n}",
            "engine": "#cwl-js-engine"
          }
        ],
        "requirements": [
          {
            "requirements": [
              {
                "dockerPull": "rabix/js-engine",
                "class": "DockerRequirement"
              }
            ],
            "class": "ExpressionEngineRequirement",
            "id": "#cwl-js-engine"
          }
        ],
        "sbg:contributors": [
          "Durga"
        ],
        "sbg:copyOf": "admin/sbg-public-data/bwa-index/15",
        "sbg:links": [
          {
            "label": "Homepage",
            "id": "http://bio-bwa.sourceforge.net/"
          },
          {
            "label": "Source code",
            "id": "https://github.com/lh3/bwa"
          },
          {
            "label": "Wiki",
            "id": "http://bio-bwa.sourceforge.net/bwa.shtml"
          },
          {
            "label": "Download",
            "id": "http://sourceforge.net/projects/bio-bwa/"
          },
          {
            "label": "Publication",
            "id": "http://www.ncbi.nlm.nih.gov/pubmed/19451168"
          }
        ],
        "sbg:id": "Durga/exome-sequencing/bwa-index/0",
        "id": "Durga/exome-sequencing/bwa-index/0",
        "arguments": [
          {
            "separate": true,
            "valueFrom": {
              "class": "Expression",
              "script": "{\n  reference_file = $job.inputs.reference.path.split('/')[$job.inputs.reference.path.split('/').length-1]\n  ext = reference_file.split('.')[reference_file.split('.').length-1]\n  if(ext=='tar' || !$job.inputs.bwt_construction){\n    return ''\n  } else {\n    return '-a ' + $job.inputs.bwt_construction\n  }\n}",
              "engine": "#cwl-js-engine"
            }
          },
          {
            "separate": true,
            "valueFrom": {
              "class": "Expression",
              "script": "{\n  reference_file = $job.inputs.reference.path.split('/')[$job.inputs.reference.path.split('/').length-1]\n  ext = reference_file.split('.')[reference_file.split('.').length-1]\n  if(ext=='tar' || !$job.inputs.prefix){\n    return ''\n  } else {\n    return '-p ' + $job.inputs.prefix\n  }\n}\n",
              "engine": "#cwl-js-engine"
            }
          },
          {
            "separate": true,
            "valueFrom": {
              "class": "Expression",
              "script": "{\n  reference_file = $job.inputs.reference.path.split('/')[$job.inputs.reference.path.split('/').length-1]\n  ext = reference_file.split('.')[reference_file.split('.').length-1]\n  if(ext=='tar' || !$job.inputs.block_size){\n    return ''\n  } else {\n    return '-b ' + $job.inputs.block_size\n  }\n}\n\n",
              "engine": "#cwl-js-engine"
            }
          },
          {
            "separate": true,
            "valueFrom": {
              "class": "Expression",
              "script": "{\n  reference_file = $job.inputs.reference.path.split('/')[$job.inputs.reference.path.split('/').length-1]\n  ext = reference_file.split('.')[reference_file.split('.').length-1]\n  if(ext=='tar' || !$job.inputs.add_64_to_fasta_name){\n    return ''\n  } else {\n    return '-6 '\n  }\n}\n",
              "engine": "#cwl-js-engine"
            }
          },
          {
            "separate": true,
            "valueFrom": {
              "class": "Expression",
              "script": "{\n  reference_file = $job.inputs.reference.path.split('/')[$job.inputs.reference.path.split('/').length-1]\n  ext = reference_file.split('.')[reference_file.split('.').length-1]\n  if(ext=='tar'){\n    return ''\n  }\n  else{\n    tar_cmd = 'tar -cf ' + reference_file + '.tar ' + reference_file + ' *.amb' + ' *.ann' + ' *.bwt' + ' *.pac' + ' *.sa' \n    return ' ; ' + tar_cmd\n  }\n}",
              "engine": "#cwl-js-engine"
            }
          }
        ],
        "sbg:latestRevision": 0,
        "hints": [
          {
            "dockerPull": "images.sbgenomics.com/vladimirk/bwa:0.7.13",
            "class": "DockerRequirement",
            "dockerImageId": "2f813371e803"
          },
          {
            "class": "sbg:CPURequirement",
            "value": 1
          },
          {
            "class": "sbg:MemRequirement",
            "value": {
              "class": "Expression",
              "script": "{\n  GB_1 = 1024*1024*1024\n  reads_size = $job.inputs.reference.size\n\n  if(!reads_size) { reads_size = GB_1 }\n  \n  if($job.inputs.total_memory){\n    return $job.inputs.total_memory * 1024\n  } else {\n    return (parseInt(1.5 * reads_size / (1024*1024)))\n  }\n}",
              "engine": "#cwl-js-engine"
            }
          }
        ],
        "sbg:image_url": null,
        "sbg:sbgMaintained": false,
        "sbg:createdBy": "Durga",
        "label": "BWA INDEX",
        "successCodes": [],
        "sbg:revisionNotes": "Copy of admin/sbg-public-data/bwa-index/15",
        "sbg:categories": [
          "Indexing",
          "FASTA-Processing"
        ],
        "y": 313.05730183919275,
        "sbg:modifiedOn": 1477014219
      },
      "inputs": [
        {
          "id": "#BWA_INDEX.total_memory"
        },
        {
          "id": "#BWA_INDEX.reference",
          "source": [
            "#reference"
          ]
        },
        {
          "id": "#BWA_INDEX.prefix_of_the_index_to_be_output"
        },
        {
          "id": "#BWA_INDEX.bwt_construction"
        },
        {
          "id": "#BWA_INDEX.block_size"
        },
        {
          "id": "#BWA_INDEX.add_64_to_fasta_name"
        }
      ],
      "outputs": [
        {
          "id": "#BWA_INDEX.indexed_reference"
        }
      ],
      "sbg:x": 178.66664632161462,
      "sbg:y": 313.05730183919275
    },
    {
      "id": "#BWA_MEM_Bundle",
      "run": {
        "stdin": "",
        "sbg:modifiedBy": "Durga",
        "outputs": [
          {
            "label": "Bam index",
            "outputBinding": {
              "sbg:metadata": {
                "reference_genome": {
                  "class": "Expression",
                  "script": "{\n  reference_file = $job.inputs.reference_index_tar.path.split('/')[$job.inputs.reference_index_tar.path.split('/').length-1]\n  name = reference_file.slice(0, -4) // cut .tar extension \n  \n  name_list = name.split('.')\n  ext = name_list[name_list.length-1]\n\n  if (ext == 'gz' || ext == 'GZ'){\n    a = name_list.pop() // strip fasta.gz\n    a = name_list.pop()\n  } else\n    a = name_list.pop() //strip only fasta/fa\n  \n  return name_list.join('.')\n  \n}",
                  "engine": "#cwl-js-engine"
                }
              },
              "glob": "*.bai",
              "sbg:inheritMetadataFrom": "#input_reads"
            },
            "id": "#bam_index",
            "type": [
              "null",
              "File"
            ],
            "sbg:fileTypes": "BAI",
            "description": "Bam index produced by BWA MEM Bundle, if SortedBAM output format is chosen."
          },
          {
            "label": "Aligned SAM/BAM",
            "outputBinding": {
              "sbg:metadata": {
                "reference_genome": {
                  "class": "Expression",
                  "script": "{\n  reference_file = $job.inputs.reference_index_tar.path.split('/')[$job.inputs.reference_index_tar.path.split('/').length-1]\n  name = reference_file.slice(0, -4) // cut .tar extension \n  \n  name_list = name.split('.')\n  ext = name_list[name_list.length-1]\n\n  if (ext == 'gz' || ext == 'GZ'){\n    a = name_list.pop() // strip fasta.gz\n    a = name_list.pop()\n  } else\n    a = name_list.pop() //strip only fasta/fa\n  \n  return name_list.join('.')\n  \n}",
                  "engine": "#cwl-js-engine"
                }
              },
              "glob": "{*.sam,*.bam}",
              "sbg:inheritMetadataFrom": "#input_reads",
              "secondaryFiles": [
                ".bai",
                "^.bai"
              ]
            },
            "id": "#aligned_reads",
            "type": [
              "null",
              "File"
            ],
            "sbg:fileTypes": "SAM, BAM",
            "description": "Aligned reads."
          }
        ],
        "temporaryFailCodes": [],
        "inputs": [
          {
            "sbg:toolDefaultValue": "3",
            "label": "Verbose level",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-v"
            },
            "sbg:category": "BWA Input/output options",
            "description": "Verbose level: 1=error, 2=warning, 3=message, 4+=debugging.",
            "id": "#verbose_level",
            "type": [
              "null",
              {
                "type": "enum",
                "symbols": [
                  "1",
                  "2",
                  "3",
                  "4"
                ],
                "name": "verbose_level"
              }
            ]
          },
          {
            "label": "Use soft clipping",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "id": "#use_soft_clipping",
            "sbg:category": "BWA Input/output options",
            "description": "Use soft clipping for supplementary alignments.",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-Y"
            }
          },
          {
            "sbg:toolDefaultValue": "17",
            "label": "Unpaired read penalty",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-U"
            },
            "sbg:category": "BWA Scoring options",
            "description": "Penalty for an unpaired read pair.",
            "id": "#unpaired_read_penalty",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "15",
            "label": "Total memory",
            "required": false,
            "id": "#total_memory",
            "sbg:category": "Execution",
            "description": "Total memory to be used by the tool in GB. It's sum of BWA, Sambamba Sort and Samblaster. For fastq files of total size less than 10GB, we suggest using the default setting of 15GB, for larger files we suggest using 58GB of memory (and 32CPU cores).",
            "sbg:stageInput": null,
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "8",
            "label": "Threads",
            "required": false,
            "id": "#threads",
            "sbg:category": "Execution",
            "description": "Number of threads for BWA, Samblaster and Sambamba sort process.",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "label": "Specify distribution parameters",
            "type": [
              "null",
              {
                "type": "array",
                "items": "float",
                "name": "speficy_distribution_parameters"
              }
            ],
            "required": false,
            "id": "#speficy_distribution_parameters",
            "sbg:category": "BWA Input/output options",
            "description": "Specify the mean, standard deviation (10% of the mean if absent), max (4 sigma from the mean if absent) and min of the insert size distribution.FR orientation only. This array can have maximum four values, where first two should be specified as FLOAT and last two as INT.",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": false,
              "prefix": "-I",
              "itemSeparator": null
            }
          },
          {
            "label": "Memory for BAM sorting",
            "type": [
              "null",
              "int"
            ],
            "required": false,
            "id": "#sort_memory",
            "sbg:category": "Execution",
            "description": "Amount of RAM [Gb] to give to the sorting algorithm (if not provided will be set to one third of the total memory)."
          },
          {
            "label": "Smart pairing in input FASTQ file",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "id": "#smart_pairing_in_input_fastq",
            "sbg:category": "BWA Input/output options",
            "description": "Smart pairing in input FASTQ file (ignoring in2.fq).",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-p"
            }
          },
          {
            "sbg:toolDefaultValue": "500",
            "label": "Skip seeds with more than INT occurrences",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-c"
            },
            "sbg:category": "BWA Algorithm options",
            "description": "Skip seeds with more than INT occurrences.",
            "id": "#skip_seeds",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "label": "Skip pairing",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "id": "#skip_pairing",
            "sbg:category": "BWA Algorithm options",
            "description": "Skip pairing; mate rescue performed unless -S also in use.",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-P"
            }
          },
          {
            "label": "Skip mate rescue",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "id": "#skip_mate_rescue",
            "sbg:category": "BWA Algorithm options",
            "description": "Skip mate rescue.",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-S"
            }
          },
          {
            "sbg:toolDefaultValue": "1.5",
            "label": "Select seeds",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-r"
            },
            "sbg:category": "BWA Algorithm options",
            "description": "Look for internal seeds inside a seed longer than {-k} * FLOAT.",
            "id": "#select_seeds",
            "type": [
              "null",
              "float"
            ]
          },
          {
            "sbg:toolDefaultValue": "20",
            "label": "Seed occurrence for the 3rd round",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-y"
            },
            "sbg:category": "BWA Algorithm options",
            "description": "Seed occurrence for the 3rd round seeding.",
            "id": "#seed_occurrence_for_the_3rd_round",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "1",
            "label": "Score for a sequence match",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-A"
            },
            "sbg:category": "BWA Scoring options",
            "description": "Score for a sequence match, which scales options -TdBOELU unless overridden.",
            "id": "#score_for_a_sequence_match",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "label": "Sambamba Sort threads",
            "type": [
              "null",
              "int"
            ],
            "required": false,
            "id": "#sambamba_threads",
            "sbg:category": "Execution",
            "description": "Number of threads to pass to Sambamba sort, if used."
          },
          {
            "sbg:toolDefaultValue": "Inferred from metadata",
            "label": "Sample ID",
            "required": false,
            "id": "#rg_sample_id",
            "sbg:category": "BWA Read Group Options",
            "description": "Specify the sample ID for RG line - A human readable identifier for a sample or specimen, which could contain some metadata information. A sample or specimen is material taken from a biological entity for testing, diagnosis, propagation, treatment, or research purposes, including but not limited to tissues, body fluids, cells, organs, embryos, body excretory products, etc.",
            "type": [
              "null",
              "string"
            ]
          },
          {
            "sbg:toolDefaultValue": "Inferred from metadata",
            "label": "Platform unit ID",
            "required": false,
            "id": "#rg_platform_unit_id",
            "sbg:category": "BWA Read Group Options",
            "description": "Specify the platform unit (lane/slide) for RG line - An identifier for lanes (Illumina), or for slides (SOLiD) in the case that a library was split and ran over multiple lanes on the flow cell or slides.",
            "type": [
              "null",
              "string"
            ]
          },
          {
            "sbg:toolDefaultValue": "Inferred from metadata",
            "label": "Platform",
            "required": false,
            "id": "#rg_platform",
            "sbg:category": "BWA Read Group Options",
            "description": "Specify the version of the technology that was used for sequencing, which will be placed in RG line.",
            "type": [
              "null",
              {
                "type": "enum",
                "symbols": [
                  "454",
                  "Helicos",
                  "Illumina",
                  "Solid",
                  "IonTorrent"
                ],
                "name": "rg_platform"
              }
            ]
          },
          {
            "label": "Median fragment length",
            "type": [
              "null",
              "string"
            ],
            "required": false,
            "id": "#rg_median_fragment_length",
            "sbg:category": "BWA Read Group Options",
            "description": "Specify the median fragment length for RG line."
          },
          {
            "sbg:toolDefaultValue": "Inferred from metadata",
            "label": "Library ID",
            "required": false,
            "id": "#rg_library_id",
            "sbg:category": "BWA Read Group Options",
            "description": "Specify the identifier for the sequencing library preparation, which will be placed in RG line.",
            "type": [
              "null",
              "string"
            ]
          },
          {
            "label": "Data submitting center",
            "type": [
              "null",
              "string"
            ],
            "required": false,
            "id": "#rg_data_submitting_center",
            "sbg:category": "BWA Read Group Options",
            "description": "Specify the data submitting center for RG line."
          },
          {
            "sbg:toolDefaultValue": "1",
            "label": "Reserved number of threads on the instance",
            "required": false,
            "id": "#reserved_threads",
            "sbg:category": "Configuration",
            "description": "Reserved number of threads on the instance used by scheduler.",
            "sbg:stageInput": null,
            "type": [
              "null",
              "int"
            ]
          },
          {
            "label": "Reference Index TAR",
            "type": [
              "File"
            ],
            "required": true,
            "id": "#reference_index_tar",
            "sbg:category": "Input files",
            "description": "Reference fasta file with BWA index files packed in TAR.",
            "sbg:stageInput": "link",
            "sbg:fileTypes": "TAR"
          },
          {
            "label": "Sequencing technology-specific settings",
            "type": [
              "null",
              {
                "type": "enum",
                "symbols": [
                  "pacbio",
                  "ont2d",
                  "intractg"
                ],
                "name": "read_type"
              }
            ],
            "required": false,
            "id": "#read_type",
            "sbg:category": "BWA Scoring options",
            "description": "Sequencing technology-specific settings; Setting -x changes multiple parameters unless overriden. pacbio: -k17 -W40 -r10 -A1 -B1 -O1 -E1 -L0  (PacBio reads to ref). ont2d: -k14 -W20 -r10 -A1 -B1 -O1 -E1 -L0  (Oxford Nanopore 2D-reads to ref). intractg: -B9 -O16 -L5  (intra-species contigs to ref).",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-x"
            }
          },
          {
            "sbg:toolDefaultValue": "Constructed from per-attribute parameters or inferred from metadata.",
            "label": "Read group header",
            "required": false,
            "id": "#read_group_header",
            "sbg:category": "BWA Read Group Options",
            "description": "Read group header line such as '@RG\\tID:foo\\tSM:bar'.  This value takes precedence over per-attribute parameters.",
            "type": [
              "null",
              "string"
            ],
            "sbg:includeInPorts": true
          },
          {
            "label": "Output SAM/BAM file name",
            "type": [
              "null",
              "string"
            ],
            "required": false,
            "id": "#output_name",
            "sbg:category": "Configuration",
            "description": "Name of the output BAM file."
          },
          {
            "sbg:toolDefaultValue": "[5, 200]",
            "label": "Output in XA",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": false,
              "prefix": "-h",
              "itemSeparator": ","
            },
            "sbg:category": "BWA Input/output options",
            "description": "If there are <INT hits with score >80% of the max score, output all in XA. This array should have no more than two values.",
            "id": "#output_in_xa",
            "type": [
              "null",
              {
                "type": "array",
                "items": "int"
              }
            ]
          },
          {
            "label": "Output header",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "id": "#output_header",
            "sbg:category": "BWA Input/output options",
            "description": "Output the reference FASTA header in the XR tag.",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-V"
            }
          },
          {
            "sbg:toolDefaultValue": "SortedBAM",
            "label": "Output format",
            "required": false,
            "id": "#output_format",
            "sbg:category": "Execution",
            "description": "Specify output format (Sorted BAM option will output coordinate sorted BAM).",
            "type": [
              "null",
              {
                "type": "enum",
                "symbols": [
                  "SAM",
                  "BAM",
                  "SortedBAM"
                ],
                "name": "output_format"
              }
            ]
          },
          {
            "label": "Output alignments",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "id": "#output_alignments",
            "sbg:category": "BWA Input/output options",
            "description": "Output all alignments for SE or unpaired PE.",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-a"
            }
          },
          {
            "sbg:toolDefaultValue": "4",
            "label": "Mismatch penalty",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-B"
            },
            "sbg:category": "BWA Scoring options",
            "description": "Penalty for a mismatch.",
            "id": "#mismatch_penalty",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "19",
            "label": "Minimum seed length",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-k"
            },
            "sbg:category": "BWA Algorithm options",
            "description": "Minimum seed length for BWA MEM.",
            "id": "#minimum_seed_length",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "30",
            "label": "Minimum alignment score for a read to be output in SAM/BAM",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-T"
            },
            "sbg:category": "BWA Input/output options",
            "description": "Minimum alignment score for a read to be output in SAM/BAM.",
            "id": "#minimum_output_score",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "50",
            "label": "Mate rescue rounds",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-m"
            },
            "sbg:category": "BWA Algorithm options",
            "description": "Perform at most INT rounds of mate rescues for each read.",
            "id": "#mate_rescue_rounds",
            "type": [
              "null",
              "string"
            ]
          },
          {
            "label": "Mark shorter",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "id": "#mark_shorter",
            "sbg:category": "BWA Input/output options",
            "description": "Mark shorter split hits as secondary.",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-M"
            }
          },
          {
            "label": "Insert string to output SAM or BAM header",
            "type": [
              "null",
              "string"
            ],
            "required": false,
            "id": "#insert_string_to_header",
            "sbg:category": "BWA Input/output options",
            "description": "Insert STR to header if it starts with @; or insert lines in FILE.",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-H"
            }
          },
          {
            "label": "Input reads",
            "type": [
              {
                "type": "array",
                "items": "File",
                "name": "input_reads"
              }
            ],
            "required": true,
            "id": "#input_reads",
            "sbg:category": "Input files",
            "sbg:fileTypes": "FASTQ, FASTQ.GZ, FQ, FQ.GZ",
            "description": "Input sequence reads."
          },
          {
            "label": "Ignore ALT file",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "id": "#ignore_alt_file",
            "sbg:category": "BWA Input/output options",
            "description": "Treat ALT contigs as part of the primary assembly (i.e. ignore <idxbase>.alt file).",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-j"
            }
          },
          {
            "sbg:toolDefaultValue": "[6,6]",
            "label": "Gap open penalties",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": false,
              "prefix": "-O",
              "itemSeparator": ","
            },
            "sbg:category": "BWA Scoring options",
            "description": "Gap open penalties for deletions and insertions. This array can't have more than two values.",
            "id": "#gap_open_penalties",
            "type": [
              "null",
              {
                "type": "array",
                "items": "int"
              }
            ]
          },
          {
            "sbg:toolDefaultValue": "[1,1]",
            "label": "Gap extension",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": false,
              "prefix": "-E",
              "itemSeparator": ","
            },
            "sbg:category": "BWA Scoring options",
            "description": "Gap extension penalty; a gap of size k cost '{-O} + {-E}*k'. This array can't have more than two values.",
            "id": "#gap_extension_penalties",
            "type": [
              "null",
              {
                "type": "array",
                "items": "int"
              }
            ]
          },
          {
            "sbg:toolDefaultValue": "False",
            "label": "Filter out secondary alignments",
            "required": false,
            "id": "#filter_out_secondary_alignments",
            "sbg:category": "Execution",
            "description": "Filter out secondary alignments. Sambamba view tool will be used to perform this internally.",
            "sbg:stageInput": null,
            "type": [
              "null",
              "boolean"
            ]
          },
          {
            "sbg:toolDefaultValue": "100",
            "label": "Dropoff",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-d"
            },
            "sbg:category": "BWA Algorithm options",
            "description": "Off-diagonal X-dropoff.",
            "id": "#dropoff",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "0.50",
            "label": "Drop chains fraction",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-D"
            },
            "sbg:category": "BWA Algorithm options",
            "description": "Drop chains shorter than FLOAT fraction of the longest overlapping chain.",
            "id": "#drop_chains_fraction",
            "type": [
              "null",
              "float"
            ]
          },
          {
            "label": "Discard exact matches",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "id": "#discard_exact_matches",
            "sbg:category": "BWA Algorithm options",
            "description": "Discard full-length exact matches.",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-e"
            }
          },
          {
            "sbg:toolDefaultValue": "0",
            "label": "Discard chain length",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-W"
            },
            "sbg:category": "BWA Algorithm options",
            "description": "Discard a chain if seeded bases shorter than INT.",
            "id": "#discard_chain_length",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "MarkDuplicates",
            "label": "PCR duplicate detection",
            "required": false,
            "id": "#deduplication",
            "sbg:category": "Samblaster parameters",
            "description": "Use Samblaster for finding duplicates on sequence reads.",
            "type": [
              "null",
              {
                "type": "enum",
                "symbols": [
                  "None",
                  "MarkDuplicates",
                  "RemoveDuplicates"
                ],
                "name": "deduplication"
              }
            ]
          },
          {
            "sbg:toolDefaultValue": "[5,5]",
            "label": "Clipping penalty",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": false,
              "prefix": "-L",
              "itemSeparator": ","
            },
            "sbg:category": "BWA Scoring options",
            "description": "Penalty for 5'- and 3'-end clipping.",
            "id": "#clipping_penalty",
            "type": [
              "null",
              {
                "type": "array",
                "items": "int"
              }
            ]
          },
          {
            "sbg:toolDefaultValue": "100",
            "label": "Band width",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-w"
            },
            "sbg:category": "BWA Algorithm options",
            "description": "Band width for banded alignment.",
            "id": "#band_width",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "label": "Append comment",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "id": "#append_comment",
            "sbg:category": "BWA Input/output options",
            "description": "Append FASTA/FASTQ comment to SAM output.",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-C"
            }
          }
        ],
        "sbg:toolkit": "BWA",
        "appUrl": "/u/Durga/exome-sequencing/apps/#Durga/exome-sequencing/bwa-mem-bundle-0-7-13/0",
        "sbg:createdOn": 1476974791,
        "sbg:toolkitVersion": "0.7.13",
        "stdout": "",
        "sbg:project": "Durga/exome-sequencing",
        "sbg:revision": 0,
        "sbg:license": "BWA: GNU Affero General Public License v3.0, MIT License. Sambamba: GNU GENERAL PUBLIC LICENSE. Samblaster: The MIT License (MIT)",
        "sbg:update": "admin/sbg-public-data/bwa-mem-bundle-0-7-13/33",
        "sbg:job": {
          "allocatedResources": {
            "cpu": 1,
            "mem": 4096
          },
          "inputs": {
            "threads": null,
            "band_width": null,
            "rg_sample_id": "",
            "output_format": null,
            "rg_platform_unit_id": "",
            "read_group_header": "",
            "skip_seeds": null,
            "reference_index_tar": {
              "size": 0,
              "class": "File",
              "secondaryFiles": [
                {
                  "path": ".amb"
                },
                {
                  "path": ".ann"
                },
                {
                  "path": ".bwt"
                },
                {
                  "path": ".pac"
                },
                {
                  "path": ".sa"
                }
              ],
              "path": "/path/to/reference.b37.fasta.gz.tar"
            },
            "filter_out_secondary_alignments": false,
            "rg_data_submitting_center": "",
            "rg_library_id": "",
            "rg_platform": "Illumina",
            "output_name": "",
            "input_reads": [
              {
                "size": 30000000000,
                "class": "File",
                "secondaryFiles": [],
                "path": "/path/to/LP6005524-DNA_C01_lane_7.sorted.converted.filtered.pe_1.gz",
                "metadata": {
                  "paired_end": "2",
                  "sample_id": "dnk_sample"
                }
              },
              {
                "path": "/path/to/LP6005524-DNA_C01_lane_7.sorted.converted.filtered.pe_2.gz"
              }
            ],
            "sort_memory": 0,
            "reserved_threads": 3,
            "sambamba_threads": null,
            "rg_median_fragment_length": "",
            "total_memory": null,
            "deduplication": "MarkDuplicates"
          }
        },
        "x": 343.9524189858225,
        "class": "CommandLineTool",
        "sbg:cmdPreview": "tar -xf reference.b37.fasta.gz.tar ;  /opt/bwa-0.7.13/bwa mem  -R '@RG\\tID:1\\tPL:Illumina\\tSM:dnk_sample' -t 1  reference.b37.fasta.gz  /path/to/LP6005524-DNA_C01_lane_7.sorted.converted.filtered.pe_2.gz /path/to/LP6005524-DNA_C01_lane_7.sorted.converted.filtered.pe_1.gz  | /opt/samblaster/samblaster -i /dev/stdin -o /dev/stdout | /opt/sambamba_v0.6.0 view -t 8 -f bam -l 0 -S /dev/stdin | /opt/sambamba_v0.6.0 sort -t 1 -m 5GiB --tmpdir ./ -o LP6005524-DNA_C01_lane_7.sorted.converted.filtered.bam -l 5 /dev/stdin",
        "sbg:validationErrors": [],
        "sbg:toolAuthor": "Heng Li",
        "sbg:revisionsInfo": [
          {
            "sbg:modifiedBy": "Durga",
            "sbg:revisionNotes": "Copy of admin/sbg-public-data/bwa-mem-bundle-0-7-13/32",
            "sbg:modifiedOn": 1476974791,
            "sbg:revision": 0
          }
        ],
        "baseCommand": [
          {
            "class": "Expression",
            "script": "{\n  reference_file = $job.inputs.reference_index_tar.path.split('/')[$job.inputs.reference_index_tar.path.split('/').length-1]\n  return 'tar -xf ' + reference_file + ' ; '\n  \n}",
            "engine": "#cwl-js-engine"
          },
          "/opt/bwa-0.7.13/bwa",
          "mem"
        ],
        "requirements": [
          {
            "requirements": [
              {
                "dockerPull": "rabix/js-engine",
                "class": "DockerRequirement"
              }
            ],
            "class": "ExpressionEngineRequirement",
            "id": "#cwl-js-engine"
          }
        ],
        "sbg:contributors": [
          "Durga"
        ],
        "sbg:copyOf": "admin/sbg-public-data/bwa-mem-bundle-0-7-13/32",
        "sbg:links": [
          {
            "label": "Homepage",
            "id": "http://bio-bwa.sourceforge.net/"
          },
          {
            "label": "Source code",
            "id": "https://github.com/lh3/bwa"
          },
          {
            "label": "Wiki",
            "id": "http://bio-bwa.sourceforge.net/bwa.shtml"
          },
          {
            "label": "Download",
            "id": "http://sourceforge.net/projects/bio-bwa/"
          },
          {
            "label": "Publication",
            "id": "http://arxiv.org/abs/1303.3997"
          },
          {
            "label": "Publication BWA Algorithm",
            "id": "http://www.ncbi.nlm.nih.gov/pubmed/19451168"
          }
        ],
        "sbg:id": "Durga/exome-sequencing/bwa-mem-bundle-0-7-13/0",
        "id": "Durga/exome-sequencing/bwa-mem-bundle-0-7-13/0",
        "sbg:updateModifiedBy": "admin",
        "arguments": [
          {
            "separate": false,
            "valueFrom": {
              "class": "Expression",
              "script": "{ \n     ///////////////////////////////////////////\n    ///  SAMBAMBA VIEW   //////////////////////\n   ///////////////////////////////////////////\nfunction common_substring(a,b) {\n  var i = 0;\n  \n  while(a[i] === b[i] && i < a.length)\n  {\n    i = i + 1;\n  }\n\n  return a.slice(0, i);\n}\n  \n   // Set output file name\n  if($job.inputs.input_reads[0] instanceof Array){\n    input_1 = $job.inputs.input_reads[0][0] // scatter mode\n    input_2 = $job.inputs.input_reads[0][1]\n  } else if($job.inputs.input_reads instanceof Array){\n    input_1 = $job.inputs.input_reads[0]\n    input_2 = $job.inputs.input_reads[1]\n  }else {\n    input_1 = [].concat($job.inputs.input_reads)[0]\n    input_2 = input_1\n  }\n  full_name = input_1.path.split('/')[input_1.path.split('/').length-1] \n\n  if($job.inputs.output_name){name = $job.inputs.output_name }\n  else if ($job.inputs.input_reads.length == 1){ \n    name = full_name\n\n    if(name.slice(-3, name.length) === '.gz' || name.slice(-3, name.length) === '.GZ')\n      name = name.slice(0, -3)   \n    if(name.slice(-3, name.length) === '.fq' || name.slice(-3, name.length) === '.FQ')\n      name = name.slice(0, -3)\n    if(name.slice(-6, name.length) === '.fastq' || name.slice(-6, name.length) === '.FASTQ')\n      name = name.slice(0, -6)\n       \n  }else{\n    full_name2 = input_2.path.split('/')[input_2.path.split('/').length-1] \n    name = common_substring(full_name, full_name2)\n    \n    if(name.slice(-1, name.length) === '_' || name.slice(-1, name.length) === '.')\n      name = name.slice(0, -1)\n    if(name.slice(-2, name.length) === 'p_' || name.slice(-1, name.length) === 'p.')\n      name = name.slice(0, -2)\n    if(name.slice(-2, name.length) === 'P_' || name.slice(-1, name.length) === 'P.')\n      name = name.slice(0, -2)\n    if(name.slice(-3, name.length) === '_p_' || name.slice(-3, name.length) === '.p.')\n      name = name.slice(0, -3)\n    if(name.slice(-3, name.length) === '_pe' || name.slice(-3, name.length) === '.pe')\n      name = name.slice(0, -3)\n  }\n  \n  // Read number of threads if defined\n  if ($job.inputs.sambamba_threads){\n    threads = $job.inputs.sambamba_threads\n  }\n  else if ($job.inputs.threads){\n    threads = $job.inputs.threads\n  }\n  else { threads = 8 }\n  \n  if ($job.inputs.filter_out_secondary_alignments){\n    filt_sec = ' --filter \\'not secondary_alignment\\' '\n  }\n  else {filt_sec=' '}\n   \n  // Set output command\n  sambamba_path = '/opt/sambamba_v0.6.0'\n  if ($job.inputs.output_format == 'BAM') {\n    return \"| \" + sambamba_path + \" view -t \"+ threads + filt_sec + \"-f bam -S /dev/stdin -o \"+ name + \".bam\"\n  }\n  else if ($job.inputs.output_format == 'SAM'){ // SAM\n    return \"> \" + name + \".sam\"\n  }\n  else { // SortedBAM is considered default\n    return \"| \" + sambamba_path + \" view -t \"+ threads + filt_sec + \"-f bam -l 0 -S /dev/stdin\"\n  }\n\n}",
              "engine": "#cwl-js-engine"
            },
            "position": 111,
            "prefix": ""
          },
          {
            "separate": false,
            "valueFrom": {
              "class": "Expression",
              "script": "{\n  ///////////////////////////////////////////\n ///  SAMBAMBA SORT   //////////////////////\n///////////////////////////////////////////\n  \nfunction common_substring(a,b) {\n  var i = 0;\n  while(a[i] === b[i] && i < a.length)\n  {\n    i = i + 1;\n  }\n\n  return a.slice(0, i);\n}\n\n   // Set output file name\n  if($job.inputs.input_reads[0] instanceof Array){\n    input_1 = $job.inputs.input_reads[0][0] // scatter mode\n    input_2 = $job.inputs.input_reads[0][1]\n  } else if($job.inputs.input_reads instanceof Array){\n    input_1 = $job.inputs.input_reads[0]\n    input_2 = $job.inputs.input_reads[1]\n  }else {\n    input_1 = [].concat($job.inputs.input_reads)[0]\n    input_2 = input_1\n  }\n  full_name = input_1.path.split('/')[input_1.path.split('/').length-1] \n  \n  if($job.inputs.output_name){name = $job.inputs.output_name }\n  else if ($job.inputs.input_reads.length == 1){\n    name = full_name\n    if(name.slice(-3, name.length) === '.gz' || name.slice(-3, name.length) === '.GZ')\n      name = name.slice(0, -3)   \n    if(name.slice(-3, name.length) === '.fq' || name.slice(-3, name.length) === '.FQ')\n      name = name.slice(0, -3)\n    if(name.slice(-6, name.length) === '.fastq' || name.slice(-6, name.length) === '.FASTQ')\n      name = name.slice(0, -6)\n       \n  }else{\n    full_name2 = input_2.path.split('/')[input_2.path.split('/').length-1] \n    name = common_substring(full_name, full_name2)\n    \n    if(name.slice(-1, name.length) === '_' || name.slice(-1, name.length) === '.')\n      name = name.slice(0, -1)\n    if(name.slice(-2, name.length) === 'p_' || name.slice(-1, name.length) === 'p.')\n      name = name.slice(0, -2)\n    if(name.slice(-2, name.length) === 'P_' || name.slice(-1, name.length) === 'P.')\n      name = name.slice(0, -2)\n    if(name.slice(-3, name.length) === '_p_' || name.slice(-3, name.length) === '.p.')\n      name = name.slice(0, -3)\n    if(name.slice(-3, name.length) === '_pe' || name.slice(-3, name.length) === '.pe')\n      name = name.slice(0, -3)\n  }\n\n  //////////////////////////\n  // Set sort memory size\n  \n  reads_size = 0 // Not used because of situations when size does not exist!\n  GB_1 = 1024*1024*1024\n  if(reads_size < GB_1){ \n    suggested_memory = 4\n    suggested_cpus = 1\n  }\n  else if(reads_size < 10 * GB_1){ \n    suggested_memory = 15\n    suggested_cpus = 8\n  }\n  else { \n    suggested_memory = 58 \n    suggested_cpus = 31\n  }\n  \n  \n  if(!$job.inputs.total_memory){ total_memory = suggested_memory }\n  else{ total_memory = $job.inputs.total_memory }\n\n  // TODO:Rough estimation, should be fine-tuned!\n  if(total_memory > 16){ sorter_memory = parseInt(total_memory / 3) }\n  else{ sorter_memory = 5 }\n          \n  if ($job.inputs.sort_memory){\n    sorter_memory_string = $job.inputs.sort_memory +'GiB'\n  }\n  else sorter_memory_string = sorter_memory + 'GiB' \n  \n  // Read number of threads if defined  \n  if ($job.inputs.sambamba_threads){\n    threads = $job.inputs.sambamba_threads\n  }\n  else if ($job.inputs.threads){\n    threads = $job.inputs.threads\n  }\n  else threads = suggested_cpus\n  \n  sambamba_path = '/opt/sambamba_v0.6.0'\n  \n  // SortedBAM is considered default\n  if (!(($job.inputs.output_format == 'BAM') || ($job.inputs.output_format == 'SAM'))){\n    cmd = \"| \" + sambamba_path + \" sort -t \" + threads\n    return cmd + \" -m \"+sorter_memory_string+\" --tmpdir ./ -o \"+ name +\".bam -l 5 /dev/stdin\"\n  }\n  else return \"\"\n}\n  \n",
              "engine": "#cwl-js-engine"
            },
            "position": 112
          },
          {
            "separate": true,
            "valueFrom": {
              "class": "Expression",
              "script": "{\n    ///////////////////////////////////////////\n    ///  SAMBLASTER      //////////////////////\n   ///////////////////////////////////////////\n  if ($job.inputs.deduplication == \"MarkDuplicates\"){\n    return \"| /opt/samblaster/samblaster -i /dev/stdin -o /dev/stdout\"\n  }\n  else if ($job.inputs.deduplication == \"RemoveDuplicates\"){\n    return \"| /opt/samblaster/samblaster -r -i /dev/stdin -o /dev/stdout\"\n  }\n  else{\n   return \"\" \n  }\n}",
              "engine": "#cwl-js-engine"
            },
            "position": 110
          },
          {
            "separate": true,
            "valueFrom": {
              "class": "Expression",
              "script": "{\n  \n  if($job.inputs.read_group_header){\n  \treturn '-R ' + $job.inputs.read_group_header\n  }\n    \n  function add_param(key, val){\n    if(!val){\n      return\n\t}\n    param_list.push(key + ':' + val)\n  }\n\n  param_list = []\n\n  // Set output file name\n  if($job.inputs.input_reads[0] instanceof Array){\n    input_1 = $job.inputs.input_reads[0][0] // scatter mode\n  } else if($job.inputs.input_reads instanceof Array){\n    input_1 = $job.inputs.input_reads[0]\n  }else {\n    input_1 = [].concat($job.inputs.input_reads)[0]\n  }\n  \n  //Read metadata for input reads\n  read_metadata = input_1.metadata\n  if(!read_metadata) read_metadata = []\n\n  add_param('ID', '1')\n  \n  if($job.inputs.rg_data_submitting_center){\n  \tadd_param('CN', $job.inputs.rg_data_submitting_center)\n  }\n  else if('data_submitting_center' in  read_metadata){\n  \tadd_param('CN', read_metadata.data_submitting_center)\n  }\n  \n  if($job.inputs.rg_library_id){\n  \tadd_param('LB', $job.inputs.rg_library_id)\n  }\n  else if('library_id' in read_metadata){\n  \tadd_param('LB', read_metadata.library_id)\n  }\n  \n  if($job.inputs.rg_median_fragment_length){\n  \tadd_param('PI', $job.inputs.rg_median_fragment_length)\n  }\n  \n  if($job.inputs.rg_platform){\n  \tadd_param('PL', $job.inputs.rg_platform)\n  }\n  else if('platform' in read_metadata){\n  \tadd_param('PL', read_metadata.platform)\n  }\n  \n  if($job.inputs.rg_platform_unit_id){\n  \tadd_param('PU', $job.inputs.rg_platform_unit_id)\n  }\n  else if('platform_unit_id' in read_metadata){\n  \tadd_param('PU', read_metadata.platform_unit_id)\n  }\n  \n  if($job.inputs.rg_sample_id){\n  \tadd_param('SM', $job.inputs.rg_sample_id)\n  }\n  else if('sample_id' in  read_metadata){\n  \tadd_param('SM', read_metadata.sample_id)\n  }\n    \n  return \"-R '@RG\\\\t\" + param_list.join('\\\\t') + \"'\"\n  \n}",
              "engine": "#cwl-js-engine"
            },
            "position": 1
          },
          {
            "separate": true,
            "valueFrom": {
              "class": "Expression",
              "script": "{\n  /////// Set input reads in the correct order depending of the paired end from metadata\n    \n     // Set output file name\n  if($job.inputs.input_reads[0] instanceof Array){\n    input_reads = $job.inputs.input_reads[0] // scatter mode\n  } else {\n    input_reads = $job.inputs.input_reads = [].concat($job.inputs.input_reads)\n  }\n  \n  \n  //Read metadata for input reads\n  read_metadata = input_reads[0].metadata\n  if(!read_metadata) read_metadata = []\n  \n  order = 0 // Consider this as normal order given at input: pe1 pe2\n  \n  // Check if paired end 1 corresponds to the first given read\n  if(read_metadata == []){ order = 0 }\n  else if('paired_end' in  read_metadata){ \n    pe1 = read_metadata.paired_end\n    if(pe1 != 1) order = 1 // change order\n  }\n\n  // Return reads in the correct order\n  if (input_reads.length == 1){\n    return input_reads[0].path // Only one read present\n  }\n  else if (input_reads.length == 2){\n    if (order == 0) return input_reads[0].path + ' ' + input_reads[1].path\n    else return input_reads[1].path + ' ' + input_reads[0].path\n  }\n\n}",
              "engine": "#cwl-js-engine"
            },
            "position": 101
          },
          {
            "separate": true,
            "valueFrom": {
              "class": "Expression",
              "script": "{\n  \n  reads_size = 0 \n\n  GB_1 = 1024*1024*1024\n  if(reads_size < GB_1){ suggested_threads = 1 }\n  else if(reads_size < 10 * GB_1){ suggested_threads = 8 }\n  else { suggested_threads = 31 }\n  \n  \n  if(!$job.inputs.threads){  \treturn suggested_threads  }  \n  else{    return $job.inputs.threads  }\n}",
              "engine": "#cwl-js-engine"
            },
            "position": 2,
            "prefix": "-t"
          },
          {
            "separate": true,
            "valueFrom": {
              "class": "Expression",
              "script": "{\n  reference_file = $job.inputs.reference_index_tar.path.split('/')[$job.inputs.reference_index_tar.path.split('/').length-1]\n  name = reference_file.slice(0, -4) // cut .tar extension \n  \n  return name\n  \n}",
              "engine": "#cwl-js-engine"
            },
            "position": 10
          }
        ],
        "sbg:latestRevision": 0,
        "hints": [
          {
            "dockerPull": "images.sbgenomics.com/vladimirk/bwa:0.7.13",
            "class": "DockerRequirement",
            "dockerImageId": ""
          },
          {
            "class": "sbg:CPURequirement",
            "value": {
              "class": "Expression",
              "script": "{  \n  // Calculate suggested number of CPUs depending of the input reads size\n  if ($job.inputs.input_reads.constructor == Array){\n    if ($job.inputs.input_reads[1]){\n      reads_size = $job.inputs.input_reads[0].size + $job.inputs.input_reads[1].size\n    } else{\n      reads_size = $job.inputs.input_reads[0].size\n    }\n  }\n  else{\n    reads_size = $job.inputs.input_reads.size\n  }\n  if(!reads_size) { reads_size = 0 }\n\n\n  GB_1 = 1024*1024*1024\n  if(reads_size < GB_1){ suggested_cpus = 1 }\n  else if(reads_size < 10 * GB_1){ suggested_cpus = 8 }\n  else { suggested_cpus = 31 }\n  \n  if($job.inputs.reserved_threads){ return $job.inputs.reserved_threads }\n  else if($job.inputs.threads){ return $job.inputs.threads } \n  else if($job.inputs.sambamba_threads) { return $job.inputs.sambamba_threads }\n  else{    return suggested_cpus  }\n}",
              "engine": "#cwl-js-engine"
            }
          },
          {
            "class": "sbg:MemRequirement",
            "value": {
              "class": "Expression",
              "script": "{  \n\n  // Calculate suggested number of CPUs depending of the input reads size\n  if ($job.inputs.input_reads.constructor == Array){\n    if ($job.inputs.input_reads[1]){\n      reads_size = $job.inputs.input_reads[0].size + $job.inputs.input_reads[1].size\n    } else{\n      reads_size = $job.inputs.input_reads[0].size\n    }\n  }\n  else{\n    reads_size = $job.inputs.input_reads.size\n  }\n  if(!reads_size) { reads_size = 0 }\n \n  GB_1 = 1024*1024*1024\n  if(reads_size < GB_1){ suggested_memory = 4 }\n  else if(reads_size < 10 * GB_1){ suggested_memory = 15 }\n  else { suggested_memory = 58 }\n  \n  if($job.inputs.total_memory){  \t\n    return  $job.inputs.total_memory* 1024  \n  } \n  else if($job.inputs.sort_memory){\n    return  $job.inputs.sort_memory* 1024\n  }\n  else{  \t\n    return suggested_memory * 1024  \n  }\n}",
              "engine": "#cwl-js-engine"
            }
          }
        ],
        "sbg:image_url": null,
        "description": "**BWA MEM** is an algorithm designed for aligning sequence reads onto a large reference genome. BWA MEM is implemented as a component of BWA. The algorithm can automatically choose between performing end-to-end and local alignments. BWA MEM is capable of outputting multiple alignments, and finding chimeric reads. It can be applied to a wide range of read lengths, from 70 bp to several megabases. \n\nIn order to obtain possibilities for additional fast processing of aligned reads, two tools are embedded together into the same package with BWA MEM (0.7.13): Samblaster. (0.1.22) and Sambamba (v0.6.0). \nIf deduplication of alignments is needed, it can be done by setting the parameter 'Duplication'. **Samblaster** will be used internally to perform this action.\nBesides the standard BWA MEM SAM output file, BWA MEM package has been extended to support two additional output options: a BAM file obtained by piping through **Sambamba view** while filtering out the secondary alignments, as well as a Coordinate Sorted BAM option that additionally pipes the output through **Sambamba sort**, along with an accompanying .bai file produced by **Sambamba sort** as side effect. Parameters responsible for these additional features are 'Filter out secondary alignments' and 'Output format'. Passing data from BWA MEM to Samblaster and Sambamba tools has been done through the pipes which saves processing times of two read and write of aligned reads into the hard drive. \n\nFor input reads fastq files of total size less than 10 GB we suggest using the default setting for parameter 'total memory' of 15GB, for larger files we suggest using 58 GB of memory and 32 CPU cores.\n\n**Important:**\nIn order to work BWA MEM Bundle requires fasta reference file accompanied with **bwa fasta indices** in TAR file.\nThere is the **known issue** with samblaster. It does not support processing when number of sequences in fasta is larger than 32768. If this is the case do not use deduplication option because the output BAM will be corrupted.",
        "sbg:sbgMaintained": false,
        "sbg:createdBy": "Durga",
        "label": "BWA MEM Bundle",
        "successCodes": [],
        "sbg:revisionNotes": "Copy of admin/sbg-public-data/bwa-mem-bundle-0-7-13/32",
        "sbg:categories": [
          "Alignment",
          "FASTQ-Processing"
        ],
        "sbg:updateRevisionNotes": "added piping command status check",
        "y": 392.69861782706636,
        "sbg:modifiedOn": 1476974791
      },
      "inputs": [
        {
          "id": "#BWA_MEM_Bundle.verbose_level"
        },
        {
          "id": "#BWA_MEM_Bundle.use_soft_clipping"
        },
        {
          "id": "#BWA_MEM_Bundle.unpaired_read_penalty"
        },
        {
          "id": "#BWA_MEM_Bundle.total_memory"
        },
        {
          "id": "#BWA_MEM_Bundle.threads"
        },
        {
          "id": "#BWA_MEM_Bundle.speficy_distribution_parameters"
        },
        {
          "id": "#BWA_MEM_Bundle.sort_memory"
        },
        {
          "id": "#BWA_MEM_Bundle.smart_pairing_in_input_fastq"
        },
        {
          "id": "#BWA_MEM_Bundle.skip_seeds"
        },
        {
          "id": "#BWA_MEM_Bundle.skip_pairing"
        },
        {
          "id": "#BWA_MEM_Bundle.skip_mate_rescue"
        },
        {
          "id": "#BWA_MEM_Bundle.select_seeds"
        },
        {
          "id": "#BWA_MEM_Bundle.seed_occurrence_for_the_3rd_round"
        },
        {
          "id": "#BWA_MEM_Bundle.score_for_a_sequence_match"
        },
        {
          "id": "#BWA_MEM_Bundle.sambamba_threads"
        },
        {
          "id": "#BWA_MEM_Bundle.rg_sample_id"
        },
        {
          "id": "#BWA_MEM_Bundle.rg_platform_unit_id"
        },
        {
          "id": "#BWA_MEM_Bundle.rg_platform"
        },
        {
          "id": "#BWA_MEM_Bundle.rg_median_fragment_length"
        },
        {
          "id": "#BWA_MEM_Bundle.rg_library_id"
        },
        {
          "id": "#BWA_MEM_Bundle.rg_data_submitting_center"
        },
        {
          "id": "#BWA_MEM_Bundle.reserved_threads"
        },
        {
          "id": "#BWA_MEM_Bundle.reference_index_tar",
          "source": [
            "#BWA_INDEX.indexed_reference"
          ]
        },
        {
          "id": "#BWA_MEM_Bundle.read_type"
        },
        {
          "id": "#BWA_MEM_Bundle.read_group_header"
        },
        {
          "id": "#BWA_MEM_Bundle.output_name"
        },
        {
          "id": "#BWA_MEM_Bundle.output_in_xa"
        },
        {
          "id": "#BWA_MEM_Bundle.output_header",
          "default": true
        },
        {
          "id": "#BWA_MEM_Bundle.output_format",
          "default": "SortedBAM"
        },
        {
          "id": "#BWA_MEM_Bundle.output_alignments"
        },
        {
          "id": "#BWA_MEM_Bundle.mismatch_penalty"
        },
        {
          "id": "#BWA_MEM_Bundle.minimum_seed_length"
        },
        {
          "id": "#BWA_MEM_Bundle.minimum_output_score"
        },
        {
          "id": "#BWA_MEM_Bundle.mate_rescue_rounds"
        },
        {
          "id": "#BWA_MEM_Bundle.mark_shorter"
        },
        {
          "id": "#BWA_MEM_Bundle.insert_string_to_header"
        },
        {
          "id": "#BWA_MEM_Bundle.input_reads",
          "source": [
            "#SBG_Pair_FASTQs_by_Metadata.tuple_list"
          ]
        },
        {
          "id": "#BWA_MEM_Bundle.ignore_alt_file"
        },
        {
          "id": "#BWA_MEM_Bundle.gap_open_penalties"
        },
        {
          "id": "#BWA_MEM_Bundle.gap_extension_penalties"
        },
        {
          "id": "#BWA_MEM_Bundle.filter_out_secondary_alignments"
        },
        {
          "id": "#BWA_MEM_Bundle.dropoff"
        },
        {
          "id": "#BWA_MEM_Bundle.drop_chains_fraction"
        },
        {
          "id": "#BWA_MEM_Bundle.discard_exact_matches"
        },
        {
          "id": "#BWA_MEM_Bundle.discard_chain_length"
        },
        {
          "id": "#BWA_MEM_Bundle.deduplication",
          "default": "MarkDuplicates"
        },
        {
          "id": "#BWA_MEM_Bundle.clipping_penalty"
        },
        {
          "id": "#BWA_MEM_Bundle.band_width"
        },
        {
          "id": "#BWA_MEM_Bundle.append_comment",
          "default": true
        }
      ],
      "outputs": [
        {
          "id": "#BWA_MEM_Bundle.bam_index"
        },
        {
          "id": "#BWA_MEM_Bundle.aligned_reads"
        }
      ],
      "sbg:x": 343.9524189858225,
      "sbg:y": 392.69861782706636,
      "scatter": "#BWA_MEM_Bundle.input_reads"
    },
    {
      "id": "#FastQC",
      "run": {
        "stdin": "",
        "sbg:modifiedBy": "Durga",
        "outputs": [
          {
            "label": "Report zip",
            "outputBinding": {
              "sbg:metadata": {
                "__inherit__": "input_fastq"
              },
              "glob": "*_fastqc.zip",
              "sbg:inheritMetadataFrom": "#input_fastq"
            },
            "id": "#report_zip",
            "type": [
              "null",
              "File"
            ],
            "sbg:fileTypes": "ZIP",
            "description": "Zip archive of the report"
          },
          {
            "label": "Report",
            "outputBinding": {
              "sbg:metadata": {
                "__inherit__": "input_fastq"
              },
              "glob": "*_fastqc.html",
              "sbg:inheritMetadataFrom": "#input_fastq"
            },
            "id": "#report_html",
            "type": [
              "null",
              "File"
            ],
            "sbg:fileTypes": "HTML",
            "description": "HTML file containing report."
          }
        ],
        "temporaryFailCodes": [],
        "inputs": [
          {
            "label": "Nogroup",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "id": "#nogroup",
            "sbg:category": "",
            "description": "Disable grouping of bases for reads >50bp. All reports will show data for every base in the read.  WARNING: Using this option will cause fastqc to crash and burn if you use it on really long reads, and your plots may end up a ridiculous size. You have been warned!",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": false,
              "prefix": "--nogroup"
            }
          },
          {
            "label": "Nano",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "id": "#nano",
            "sbg:category": "",
            "description": "Files come from naopore sequences and are in fast5 format. In this mode you can pass in directories to process and the program will take in all fast5 files within those directories and produce a single output file from the sequences found in all files.",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": false,
              "prefix": "--nano"
            }
          },
          {
            "label": "Limits",
            "type": [
              "null",
              "File"
            ],
            "required": false,
            "sbg:altPrefix": "-l",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--limits"
            },
            "sbg:category": "",
            "description": "Specifies a non-default file which contains a set of criteria which will be used to determine the warn/error limits for the various modules.  This file can also be used to selectively remove some modules from the output all together.  The format needs to mirror the default limits.txt file found in the Configuration folder.",
            "id": "#limits_file"
          },
          {
            "sbg:toolDefaultValue": "7",
            "label": "Kmers",
            "required": false,
            "sbg:altPrefix": "-f",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--kmers"
            },
            "sbg:category": "",
            "description": "Specifies the length of Kmer to look for in the Kmer content module. Specified Kmer length must be between 2 and 10. Default length is 7 if not specified.",
            "id": "#kmers",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "label": "Input file",
            "type": [
              "File"
            ],
            "required": true,
            "id": "#input_fastq",
            "sbg:category": "",
            "description": "Input file.",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "position": 100
            }
          },
          {
            "label": "Format",
            "type": [
              "null",
              {
                "type": "enum",
                "symbols": [
                  "bam",
                  "sam",
                  "bam_mapped",
                  "sam_mapped",
                  "fastq"
                ],
                "name": "format"
              }
            ],
            "required": false,
            "sbg:altPrefix": "-f",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--format"
            },
            "sbg:category": "",
            "description": "Bypasses the normal sequence file format detection and forces the program to use the specified format.  Valid formats are BAM, SAM, BAM_mapped, SAM_mapped and FASTQ.",
            "id": "#format"
          },
          {
            "label": "Contaminants",
            "type": [
              "null",
              "File"
            ],
            "required": false,
            "sbg:altPrefix": "-c",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--contaminants"
            },
            "sbg:category": "",
            "description": "Specifies a non-default file which contains the list of contaminants to screen overrepresented sequences against. The file must contain sets of named contaminants in the form name[tab]sequence.  Lines prefixed with a hash will be ignored.",
            "id": "#contaminants_file"
          },
          {
            "label": "Casava",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "id": "#casava",
            "sbg:category": "",
            "description": "Files come from raw casava output. Files in the same sample group (differing only by the group number) will be analysed as a set rather than individually. Sequences with the filter flag set in the header will be excluded from the analysis. Files must have the same names given to them by casava (including being gzipped and ending with .gz) otherwise they won't be grouped together correctly.",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": false,
              "prefix": "--casava"
            }
          },
          {
            "label": "Adapters",
            "type": [
              "null",
              "File"
            ],
            "required": false,
            "sbg:altPrefix": "-a",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--adapters"
            },
            "sbg:category": "",
            "description": "Specifies a non-default file which contains the list of adapter sequences which will be explicity searched against the library. The file must contain sets of named adapters in the form name[tab]sequence.  Lines prefixed with a hash will be ignored.",
            "id": "#adapters_file"
          }
        ],
        "sbg:toolkit": "FastQC",
        "appUrl": "/u/Durga/test1-tumor-normal/apps/#Durga/test1-tumor-normal/fastqc-0-11-4/0",
        "sbg:createdOn": 1454685368,
        "sbg:toolkitVersion": "0.11.4",
        "stdout": "",
        "sbg:project": "Durga/test1-tumor-normal",
        "sbg:revision": 0,
        "sbg:license": "GNU General Public License v3.0 only",
        "sbg:update": "admin/sbg-public-data/fastqc-0-11-4/5",
        "sbg:job": {
          "allocatedResources": {
            "cpu": 1,
            "mem": 2048
          },
          "inputs": {
            "input_fastq": {
              "path": "/root/dir/example.fastq"
            }
          }
        },
        "x": 277.1428680419923,
        "class": "CommandLineTool",
        "sbg:cmdPreview": "fastqc  --noextract --outdir .  --quiet --threads 4  /root/dir/example.fastq /root/dir/example.fastq",
        "sbg:validationErrors": [],
        "sbg:toolAuthor": "Babraham Institute",
        "sbg:revisionsInfo": [
          {
            "sbg:modifiedBy": "Durga",
            "sbg:revisionNotes": null,
            "sbg:modifiedOn": 1454685368,
            "sbg:revision": 0
          }
        ],
        "baseCommand": [
          "fastqc"
        ],
        "requirements": [],
        "sbg:contributors": [
          "Durga"
        ],
        "sbg:copyOf": "admin/sbg-public-data/fastqc-0-11-4/0",
        "sbg:links": [
          {
            "label": "Homepage",
            "id": "http://www.bioinformatics.babraham.ac.uk/projects/fastqc/"
          },
          {
            "label": "Source Code",
            "id": "http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.4_source.zip"
          },
          {
            "label": "Wiki",
            "id": "https://wiki.hpcc.msu.edu/display/Bioinfo/FastQC+Tutorial"
          },
          {
            "label": "Download",
            "id": "http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.4.zip"
          },
          {
            "label": "Publication",
            "id": ""
          }
        ],
        "sbg:id": "Durga/test1-tumor-normal/fastqc-0-11-4/0",
        "id": "Durga/test1-tumor-normal/fastqc-0-11-4/0",
        "sbg:updateModifiedBy": "admin",
        "arguments": [
          {
            "separate": true,
            "valueFrom": "--noextract",
            "prefix": ""
          },
          {
            "separate": true,
            "valueFrom": ".",
            "prefix": "--outdir"
          },
          {
            "separate": true,
            "valueFrom": "--quiet",
            "prefix": ""
          },
          {
            "separate": true,
            "valueFrom": "4",
            "prefix": "--threads"
          }
        ],
        "hints": [
          {
            "dockerPull": "images.sbgenomics.com/mladenlsbg/fastqc:0.11.4",
            "class": "DockerRequirement",
            "dockerImageId": "759c4c8fbafd"
          },
          {
            "class": "sbg:CPURequirement",
            "value": 1
          },
          {
            "class": "sbg:MemRequirement",
            "value": 2048
          }
        ],
        "sbg:image_url": null,
        "description": "FastQC reads a set of sequence files and produces a quality control (QC) report from each one. These reports consist of a number of different modules, each of which will help identify a different type of potential problem in your data.\n\nFastQC is a tool which takes a FastQ file and runs a series of tests on it to generate a comprehensive QC report.  This report will tell you if there is anything unusual about your sequence.  Each test is flagged as a pass, warning, or fail depending on how far it departs from what you would expect from a normal large dataset with no significant biases.  It is important to stress that warnings or even failures do not necessarily mean that there is a problem with your data, only that it is unusual.  It is possible that the biological nature of your sample means that you would expect this particular bias in your results.",
        "sbg:sbgMaintained": false,
        "sbg:createdBy": "Durga",
        "label": "FastQC",
        "successCodes": [],
        "sbg:latestRevision": 0,
        "sbg:categories": [
          "FASTQ-Processing",
          "Quality-Control",
          "Quantification"
        ],
        "sbg:updateRevisionNotes": "FASTQ input changed from single file to array. Added better thread handling.\n\nIMPORTANT NOTICE: If updating this tool in existing workflow, it's necessary to REMOVE SCATTER (uncheck it) from input_fastq or it might break the pipeline.",
        "y": 595.4185866329606,
        "sbg:modifiedOn": 1454685368
      },
      "inputs": [
        {
          "id": "#FastQC.nogroup"
        },
        {
          "id": "#FastQC.nano"
        },
        {
          "id": "#FastQC.limits_file"
        },
        {
          "id": "#FastQC.kmers"
        },
        {
          "id": "#FastQC.input_fastq",
          "source": [
            "#fastq_list"
          ]
        },
        {
          "id": "#FastQC.format"
        },
        {
          "id": "#FastQC.contaminants_file"
        },
        {
          "id": "#FastQC.casava"
        },
        {
          "id": "#FastQC.adapters_file"
        }
      ],
      "outputs": [
        {
          "id": "#FastQC.report_zip"
        },
        {
          "id": "#FastQC.report_html"
        }
      ],
      "sbg:x": 277.1428680419923,
      "sbg:y": 595.4185866329606,
      "scatter": "#FastQC.input_fastq"
    },
    {
      "id": "#SBG_Pair_FASTQs_by_Metadata",
      "run": {
        "stdin": "",
        "sbg:modifiedBy": "admin",
        "outputs": [
          {
            "type": [
              "null",
              {
                "type": "array",
                "items": "File"
              }
            ],
            "id": "#tuple_list"
          }
        ],
        "temporaryFailCodes": [],
        "inputs": [
          {
            "label": "List of FASTQ files",
            "required": true,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "position": 0,
              "prefix": "--fastq_list",
              "itemSeparator": ","
            },
            "type": [
              {
                "type": "array",
                "items": "File",
                "name": "fastq_list"
              }
            ],
            "description": "List of the FASTQ files with properly set metadata fileds.",
            "id": "#fastq_list",
            "sbg:fileTypes": "FASTQ, FQ, FASTQ.GZ, FQ.GZ",
            "sbg:stageInput": "link"
          }
        ],
        "sbg:toolkit": "SBGTools",
        "description": "Tool accepts list of FASTQ files for one sample as the input and groups them into pairs  (two files for each paired end). This grouping is done using metadata values that are creating unique combination for each pair or of FASTQ files. Metadata that fields that are uniquely defining one FASTQ pair are Sample ID, Library ID, Platform unit ID and File segment number. Listed order of metadata fields is also representing their hierarchy in the metadata structure. Not all of these four metadata fields are required, but the present set has to be sufficient to create unique combinations for each pair of FASTQ files.",
        "sbg:createdOn": 1447846727,
        "stdout": "",
        "sbg:project": "admin/sbg-public-data",
        "sbg:revision": 4,
        "sbg:license": "Apache License 2.0",
        "requirements": [
          {
            "fileDef": [
              {
                "fileContent": "import functools\nimport json\nimport itertools\nimport docopt\nimport types\nUSAGE = \"\"\"\n    Usage:\n    \tsbg_pair_fastqs_by_metadata.py --fastq_list FILE... --in_metafile FILE --out_metafile FILE [options]\n\n    Description:\n        Tool accepts list of FATSQ files for one sample as the input and groups them into pairs\n        (two files for each paired end). This grouping is done using metadata values that are creating\n        unique combination for each pair or of FASTQ files. Metadata that fields that are uniquely defining\n        one FASTQ pair are Sample ID, Library ID, Platform Unit ID and File Segment Number. Listed order of metadata fields is also\n        representing their hierarchy in the metadata structure. Not all of these four metadata fields are required,\n        but the present set has to be sufficient to create unique combinations for each pair of FASTQ files.\n\n    Options:\n\n        --help                                Show help dialog.\n\n        --version                             Tool version.\n\n        --fatsq_list FILE...                  List of the FASTQ files with properly set metadata fileds.\n\n        --in_metafile FILE                    File from which necessary metadata information will be extracted.\n                                              Expected value for the SBG platfrom is job.json. [Default: job.json]\n\n        --out_metafile FILE                   File into which necessary file structure is going to be written.\n                                              Expected value for the SBG platform is cwl.output.json.\n                                              [Default: cwl.output.json]\n\n\n\"\"\"\n\ndef make_rg_id(metadata_key, input1):\n\n    input_meta = input1.values()[0]\n\n    S = '__!__'\n    rg = list()\n    for key in ['sample_group', 'sample_id', 'library_id', 'platform_unit_id']:\n        if key in input_meta:\n            rg.append(input_meta[key])\n        else:\n            rg.append('')\n    if 'file_segment_number' in input_meta and input_meta['file_segment_number'] is not None:\n        rg.append(str(input_meta['file_segment_number']))\n    else:\n        rg.append('')\n\n    rg_map = {\n        'sample_id': rg[:2],\n        'library_id': rg[:3],\n        'platform_unit_id': rg[:4],\n        'file_segment_number': rg[:5],\n    }\n\n    return S.join(rg_map[metadata_key]) if metadata_key in rg_map else getattr(input_meta, metadata_key)\n\n\ndef group_inputs(inp):\n\n    metadata_key = 'file_segment_number'\n    if str(metadata_key) == 'None':\n        return {'': [f for f in inp]}\n    if metadata_key == 'file':\n        return {f: [f] for f in inp}\n    key_getter = functools.partial(make_rg_id, metadata_key)\n    print inp\n    files = sorted([x for x in inp], key=key_getter)\n    tuple_list_temp = [[f for f in val] for key, val in itertools.groupby(files, key_getter)]\n    tuple_list=list()\n    for elem in tuple_list_temp:\n        for key in elem[0].keys():\n            if len(files) != 1:\n                if elem[0][key]['paired_end'] == \"2\":\n                    tuple_list.append([str(elem[1].keys()[0]), str(elem[0].keys()[0])])\n                else:\n                    tuple_list.append([str(elem[0].keys()[0]), str(elem[1].keys()[0])])\n            else:\n                    tuple_list.append([str(elem[0].keys()[0])])\n\n    print tuple_list\n    return tuple_list\n\ndef main():\n\n    args = docopt.docopt(USAGE, version = 1.0)\n\n    job_json = args[\"--in_metafile\"]\n    job_json_file = open(job_json)\n    job_json_str = job_json_file.read()\n    job_json_dict = json.loads(job_json_str)\n    fastq_list = job_json_dict['inputs'][\"fastq_list\"]\n    if isinstance(fastq_list, list):\n        fastq_list = job_json_dict['inputs'][\"fastq_list\"]\n    else:\n        fastq_list = list()\n        fastq_list.append(job_json_dict['inputs'][\"fastq_list\"])\n    file_list = [{elem['path'] : elem['metadata']} for elem in fastq_list]\n    tuple_list = group_inputs(file_list)\n\n    for elem in tuple_list:\n        for i in range(0,len(elem)):\n            elem[i] = {\"class\": \"File\", \"path\": elem[i]}\n\n\n    tuple_list_dict = {\"tuple_list\": tuple_list}\n    with open(args[\"--out_metafile\"], 'w') as p:\n        json.dump(tuple_list_dict, p)\n\nif __name__ == '__main__':\n    main()",
                "filename": "pair_fastqs_by_metadata.py"
              }
            ],
            "class": "CreateFileRequirement"
          }
        ],
        "sbg:job": {
          "allocatedResources": {
            "cpu": 1,
            "mem": 1024
          },
          "inputs": {
            "fastq_list": [
              {
                "size": 0,
                "class": "File",
                "secondaryFiles": [],
                "path": "/asda/dsa/sda/sda/fasta1.fastq"
              },
              {
                "path": "/asda/dsa/sda/sda/fasta2.fastq"
              },
              {
                "path": "/asda/dsa/sda/sda/fasta3.fastq"
              },
              {
                "path": "/asda/dsa/sda/sda/fasta4.fastq"
              }
            ]
          }
        },
        "x": 68.57145622798534,
        "class": "CommandLineTool",
        "sbg:cmdPreview": "python pair_fastqs_by_metadata.py --fastq_list /asda/dsa/sda/sda/fasta1.fastq,/asda/dsa/sda/sda/fasta2.fastq,/asda/dsa/sda/sda/fasta3.fastq,/asda/dsa/sda/sda/fasta4.fastq --in_metafile job.json --out_metafile cwl.output.json",
        "sbg:validationErrors": [],
        "sbg:categories": [
          "Converters",
          "Other"
        ],
        "sbg:revisionsInfo": [
          {
            "sbg:modifiedBy": "djordje_klisic",
            "sbg:revisionNotes": null,
            "sbg:modifiedOn": 1447846727,
            "sbg:revision": 0
          },
          {
            "sbg:modifiedBy": "djordje_klisic",
            "sbg:revisionNotes": null,
            "sbg:modifiedOn": 1449055249,
            "sbg:revision": 1
          },
          {
            "sbg:modifiedBy": "djordje_klisic",
            "sbg:revisionNotes": null,
            "sbg:modifiedOn": 1463578054,
            "sbg:revision": 2
          },
          {
            "sbg:modifiedBy": "admin",
            "sbg:revisionNotes": "Link fastq_list",
            "sbg:modifiedOn": 1471952983,
            "sbg:revision": 3
          },
          {
            "sbg:modifiedBy": "admin",
            "sbg:revisionNotes": "Added support for single file.",
            "sbg:modifiedOn": 1472135979,
            "sbg:revision": 4
          }
        ],
        "baseCommand": [
          "python",
          "pair_fastqs_by_metadata.py"
        ],
        "label": "SBG Pair FASTQs by Metadata",
        "sbg:contributors": [
          "djordje_klisic",
          "admin"
        ],
        "sbg:links": [
          {
            "label": "Homepage",
            "id": "https://cgc.sbgenomics.com/u/stefanristeski/group-fastqs/apps/#sbg-pair-fastqs-by-metadata/9"
          }
        ],
        "sbg:id": "admin/sbg-public-data/sbg-pair-fastqs-by-metadata/4",
        "id": "admin/sbg-public-data/sbg-pair-fastqs-by-metadata/4",
        "arguments": [
          {
            "separate": true,
            "valueFrom": "job.json",
            "position": 1,
            "prefix": "--in_metafile"
          },
          {
            "separate": true,
            "valueFrom": "cwl.output.json",
            "position": 2,
            "prefix": "--out_metafile"
          }
        ],
        "sbg:latestRevision": 4,
        "hints": [
          {
            "dockerPull": "images.sbgenomics.com/djordje_klisic/sbg-pair-fastqs-by-metadata:1.0",
            "class": "DockerRequirement",
            "dockerImageId": "d41a0837ab81"
          },
          {
            "class": "sbg:CPURequirement",
            "value": 1
          },
          {
            "class": "sbg:MemRequirement",
            "value": 1024
          }
        ],
        "sbg:image_url": null,
        "sbg:revisionNotes": "Added support for single file.",
        "sbg:createdBy": "djordje_klisic",
        "successCodes": [],
        "sbg:sbgMaintained": false,
        "sbg:toolAuthor": "Djordje Klisic, Seven Bridges Genomics, <djordje.klisic@sbgenomics.com>",
        "y": 478.59390467193293,
        "sbg:modifiedOn": 1472135979
      },
      "inputs": [
        {
          "id": "#SBG_Pair_FASTQs_by_Metadata.fastq_list",
          "source": [
            "#fastq_list"
          ]
        }
      ],
      "outputs": [
        {
          "id": "#SBG_Pair_FASTQs_by_Metadata.tuple_list"
        }
      ],
      "sbg:x": 68.57145622798534,
      "sbg:y": 478.59390467193293
    },
    {
      "id": "#Sambamba_Merge",
      "run": {
        "stdin": "",
        "sbg:modifiedBy": "Durga",
        "outputs": [
          {
            "label": "Merged bam",
            "outputBinding": {
              "sbg:inheritMetadataFrom": "#bams",
              "glob": "*.bam",
              "secondaryFiles": [
                ".bai",
                "^.bai"
              ]
            },
            "id": "#merged_bam",
            "type": [
              "null",
              "File"
            ],
            "sbg:fileTypes": "BAM",
            "description": "Merged bam."
          }
        ],
        "temporaryFailCodes": [],
        "inputs": [
          {
            "sbg:toolDefaultValue": "1",
            "label": "Number of threads reserved on the instance",
            "required": false,
            "id": "#reserved_threads",
            "sbg:category": "Execution",
            "description": "Number of threads reserved on the instance passed to the scheduler (number of jobs).",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "label": "Number of threads to use",
            "type": [
              "null",
              "int"
            ],
            "required": false,
            "id": "#num_of_threads",
            "sbg:category": "Merge",
            "description": "Number of threads to use for compression/decompression."
          },
          {
            "sbg:toolDefaultValue": "1024",
            "label": "Memory in MB",
            "required": false,
            "id": "#mem_mb",
            "sbg:category": "Execution",
            "description": "Memory in MB.",
            "sbg:stageInput": null,
            "type": [
              "null",
              "int"
            ]
          },
          {
            "label": "Compression level",
            "type": [
              "null",
              "int"
            ],
            "required": false,
            "id": "#compression_level",
            "sbg:category": "Merge",
            "description": "Level of compression for merged BAM file, number from 0 to 9."
          },
          {
            "label": "BAM files",
            "type": [
              {
                "type": "array",
                "items": "File",
                "name": "bams"
              }
            ],
            "required": true,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "position": 5,
              "itemSeparator": null
            },
            "sbg:category": "Merge",
            "description": "Input BAM files.",
            "id": "#bams",
            "sbg:fileTypes": "BAM"
          }
        ],
        "sbg:toolkit": "Sambamba",
        "appUrl": "/u/Durga/exome-sequencing/apps/#Durga/exome-sequencing/sambamba-merge-0-5-9/0",
        "sbg:createdOn": 1477927984,
        "sbg:toolkitVersion": "0.5.9",
        "stdout": "",
        "sbg:project": "Durga/exome-sequencing",
        "sbg:revision": 0,
        "sbg:license": "GNU General Public License v2.0 only",
        "sbg:job": {
          "allocatedResources": {
            "cpu": 2,
            "mem": 2
          },
          "inputs": {
            "reserved_threads": 2,
            "compression_level": null,
            "num_of_threads": 6,
            "mem_mb": 2,
            "bams": [
              {
                "size": 0,
                "class": "File",
                "secondaryFiles": [],
                "path": "/path/to/uuu_bams.bam",
                "metadata": {
                  "sample_id": "testmeta"
                }
              },
              {
                "size": 0,
                "class": "File",
                "secondaryFiles": [],
                "path": "/path/to/uyyy_bams.bam"
              }
            ]
          }
        },
        "class": "CommandLineTool",
        "x": 684.5238769849158,
        "sbg:cmdPreview": "/opt/sambamba_0.5.9/sambamba_v0.5.9 merge  -t 6  /path/to/uuu_bams.bam  /path/to/uyyy_bams.bam  testmeta__bams.merged.bam",
        "sbg:validationErrors": [],
        "sbg:toolAuthor": "Artem Tarasov",
        "sbg:revisionsInfo": [
          {
            "sbg:modifiedBy": "Durga",
            "sbg:revisionNotes": "Copy of admin/sbg-public-data/sambamba-merge-0-5-9/18",
            "sbg:modifiedOn": 1477927984,
            "sbg:revision": 0
          }
        ],
        "baseCommand": [
          {
            "class": "Expression",
            "script": "{\n  if ($job.inputs.bams instanceof Array) { // VK\n    if ($job.inputs.bams[0] instanceof Array) {\n      \n      // Support for input received as list of one-element-lists \n      in_var = []\n      for (i=0;i<$job.inputs.bams.length;i++) \n  \t\tin_var = in_var.concat($job.inputs.bams[i]);\n      \n    } else {\n      in_var = [].concat($job.inputs.bams)\n    }\n  \n  \n  } else {\n    in_var = [].concat($job.inputs.bams)\n  }\n  comm=''\n  if(in_var instanceof Array) // Always true\n  {\n    if(in_var.length==1)\n    {\n      comm+='cp '\n      \n    }\n  \telse if(in_var.length>1)\n  \t{\n    \n    \tcomm+='/opt/sambamba_0.5.9/sambamba_v0.5.9 merge '\n    \tif($job.inputs.num_of_threads)\n  \t\t{\n    \t\tcomm+=' -t '\n    \t\tcomm+=$job.inputs.num_of_threads\n  \t\t}\n  \t\tif($job.inputs.compression_level)\n  \t\t{\n   \t\t\tcomm+=' -l '\n    \t\tcomm+=$job.inputs.compression_level\n  \t\t}\n   \t\t\n    }\n  \n  \t\n\n  }\n  return comm\n}",
            "engine": "#cwl-js-engine"
          }
        ],
        "requirements": [
          {
            "requirements": [
              {
                "dockerPull": "rabix/js-engine",
                "class": "DockerRequirement"
              }
            ],
            "class": "ExpressionEngineRequirement",
            "id": "#cwl-js-engine"
          }
        ],
        "sbg:contributors": [
          "Durga"
        ],
        "sbg:copyOf": "admin/sbg-public-data/sambamba-merge-0-5-9/18",
        "sbg:links": [
          {
            "label": "Homepage",
            "id": "http://lomereiter.github.io/sambamba/docs/sambamba-view.html"
          },
          {
            "label": "Source code",
            "id": "https://github.com/lomereiter/sambamba"
          },
          {
            "label": "Wiki",
            "id": "https://github.com/lomereiter/sambamba/wiki"
          },
          {
            "label": "Download",
            "id": "https://github.com/lomereiter/sambamba/releases/tag/v0.5.9"
          },
          {
            "label": "Publication",
            "id": "http://lomereiter.github.io/sambamba/docs/sambamba-view.html"
          }
        ],
        "sbg:id": "Durga/exome-sequencing/sambamba-merge-0-5-9/0",
        "id": "Durga/exome-sequencing/sambamba-merge-0-5-9/0",
        "arguments": [
          {
            "separate": true,
            "valueFrom": {
              "class": "Expression",
              "script": "{\n  if ($job.inputs.bams instanceof Array) { // VK\n    if ($job.inputs.bams[0] instanceof Array) {\n      \n      // Support for input received as list of one-element-lists \n      in_var = []\n      for (i=0;i<$job.inputs.bams.length;i++) \n  \t\tin_var = in_var.concat($job.inputs.bams[i]);\n      \n    } else {\n      in_var = [].concat($job.inputs.bams)\n    }\n  \n  \n  } else {\n    in_var = [].concat($job.inputs.bams)\n  }\n  \n  comm=''\n  if(in_var.length==1)\n  {\n  \tcomm+='. '\n  \n  \tif(in_var[0].secondaryFiles!=undefined && in_var[0].secondaryFiles.length>0)\n  \t{\n    \t comm+='| cp '\n    \t comm+=in_var[0].secondaryFiles[0].path\n    \t comm+=' . '\n  \t}\n  }\n  return comm\n}",
              "engine": "#cwl-js-engine"
            },
            "position": 10
          },
          {
            "separate": true,
            "valueFrom": {
              "class": "Expression",
              "script": "{\n\n  function common_end(strs) {\n  \n  \t// Find minimum length of file name\n  \n  \tls = [];\n    whole = [];\n\tfor (i=0;i<strs.length;i++){\n  \t\tls = ls.concat(strs[i].path.split('/').pop().length);\n        whole = whole.concat(strs[i].path.length);\n  \t}\n \tl = Math.min.apply(Math,ls);\n  \n  \t// Loop from the end through characters and check if they are the same for all\n  \n \tind = 0;\n \tflag = 0;\n \tfor (i=1;i<=l;i++){\n    \tfor (j=1;j<strs.length;j++){\n      \t\tif (strs[0].path[whole[0]-i]!=strs[j].path[whole[j]-i]){\n        \tflag = 1;\n        \tbreak\n      \t\t}\n   \t\t}\n   \t \tif (flag == 1){\n   \t \t  \tbreak\n   \t    } else {\n      \t\tind = ind + 1;\n        }\n  \t }\n  \n  // Assign and return longest ending common substring\n  if (ind>0) {\n  \tcomstr = strs[0].path.slice(-ind);\n  } else {\n    comstr = 'different_extensions'\n  }\n  \n  return comstr\n  \n  }\n  \n  if ($job.inputs.bams instanceof Array) { // VK\n    if ($job.inputs.bams[0] instanceof Array) {\n      \n      // Support for input received as list of one-element-lists \n      in_var = []\n      for (i=0;i<$job.inputs.bams.length;i++) \n  \t\tin_var = in_var.concat($job.inputs.bams[i]);\n      \n    } else {\n      in_var = [].concat($job.inputs.bams)\n    }\n  \n  \n  } else {\n    in_var = [].concat($job.inputs.bams)\n  }\n  \n  prefix=''\n  \n  if(in_var.length==1) { \n    return '' // Input will be just passed to output\n  }else if (in_var[0].metadata){\n \t   if (\"sample_id\" in in_var[0].metadata){   \n  \t\t prefix = in_var[0].metadata[\"sample_id\"];      \n   \t    } else {\n   \t\t  prefix = 'sample_unknown';\n        }\n   \n  }else {\n    prefix = 'sample_unknown';   \n  }\n  \n  // Create joint name and add the merged suffix\n  joint_name = prefix + '_' + common_end(in_var);\n  name = joint_name.split('.').slice(0,-1).join('.') + '.merged.bam'\n  \n  \n  \n  return name\n  \n}\n\n\n",
              "engine": "#cwl-js-engine"
            },
            "position": 5
          }
        ],
        "sbg:latestRevision": 0,
        "hints": [
          {
            "class": "sbg:CPURequirement",
            "value": {
              "class": "Expression",
              "script": "{\n  if ($job.inputs.reserved_threads) {\n    \n    return $job.inputs.reserved_threads\n    \n  } else if ($job.inputs.num_of_threads) {\n    \n    return $job.inputs.num_of_threads\n    \n  } else {\n    \n    return 1\n  }\n  \n}",
              "engine": "#cwl-js-engine"
            }
          },
          {
            "class": "sbg:MemRequirement",
            "value": {
              "class": "Expression",
              "script": "{\n  if ($job.inputs.mem_mb) {\n    \n    return $job.inputs.mem_mb\n    \n  } else {\n    \n    return 1024\n    \n  }\n  \n}",
              "engine": "#cwl-js-engine"
            }
          },
          {
            "dockerPull": "images.sbgenomics.com/mladenlsbg/sambamba:0.5.9",
            "class": "DockerRequirement",
            "dockerImageId": ""
          }
        ],
        "sbg:image_url": null,
        "description": "Sambamba Merge is used for merging several sorted BAM files into one. The sorting order of all the files must be the same, and it is maintained in the output file.",
        "sbg:sbgMaintained": false,
        "sbg:createdBy": "Durga",
        "label": "Sambamba Merge",
        "successCodes": [],
        "sbg:revisionNotes": "Copy of admin/sbg-public-data/sambamba-merge-0-5-9/18",
        "sbg:categories": [
          "SAM/BAM-Processing"
        ],
        "y": 300.650986988268,
        "sbg:modifiedOn": 1477927984
      },
      "inputs": [
        {
          "id": "#Sambamba_Merge.reserved_threads"
        },
        {
          "id": "#Sambamba_Merge.num_of_threads"
        },
        {
          "id": "#Sambamba_Merge.mem_mb"
        },
        {
          "id": "#Sambamba_Merge.compression_level"
        },
        {
          "id": "#Sambamba_Merge.bams",
          "source": [
            "#BWA_MEM_Bundle.aligned_reads"
          ]
        }
      ],
      "outputs": [
        {
          "id": "#Sambamba_Merge.merged_bam"
        }
      ],
      "sbg:x": 684.5238769849158,
      "sbg:y": 300.650986988268
    },
    {
      "id": "#GATK_IndelRealigner",
      "run": {
        "stdin": "",
        "sbg:modifiedBy": "admin",
        "outputs": [
          {
            "label": "Realigned BAM",
            "outputBinding": {
              "sbg:metadata": {
                "intervals_file": {
                  "class": "Expression",
                  "script": "{\n  if ($job.inputs.target_intervals)\n    if($job.inputs.target_intervals.metadata)\n      if('intervals_file' in $job.inputs.target_intervals.metadata)\n        return $job.inputs.target_intervals.metadata.intervals_file\n  return 'NO_INTERVALS'\n}",
                  "engine": "#cwl-js-engine"
                }
              },
              "glob": "*.realigned.bam",
              "sbg:inheritMetadataFrom": "#reads",
              "secondaryFiles": [
                ".bai",
                "^.bai"
              ]
            },
            "id": "#realigned_bam_file",
            "type": [
              "null",
              "File"
            ],
            "sbg:fileTypes": "BAM",
            "description": "Realigned BAM."
          }
        ],
        "temporaryFailCodes": [],
        "inputs": [
          {
            "sbg:toolDefaultValue": "SILENT",
            "label": "Validation Strictness",
            "required": false,
            "sbg:altPrefix": "-S",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--validation_strictness",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "How strict should we be with validation.",
            "id": "#validation_strictness",
            "type": [
              "null",
              {
                "type": "enum",
                "symbols": [
                  "SILENT",
                  "LENIENT",
                  "STRICT"
                ],
                "name": "validation_strictness"
              }
            ]
          },
          {
            "sbg:toolDefaultValue": "False",
            "label": "Use Original Qualities",
            "required": false,
            "sbg:altPrefix": "-OQ",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--useOriginalQualities",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "If set, use the original base quality scores from the OQ tag when present instead of the standard scores.",
            "id": "#use_original_qualities",
            "type": [
              "null",
              "boolean"
            ]
          },
          {
            "sbg:toolDefaultValue": "False",
            "label": "Use Legacy Downsampler",
            "required": false,
            "sbg:altPrefix": "-use_legacy_downsampler",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--use_legacy_downsampler",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "Use the legacy downsampling implementation instead of the newer, less-tested implementation.",
            "id": "#use_legacy_downsampler",
            "type": [
              "null",
              "boolean"
            ]
          },
          {
            "sbg:toolDefaultValue": "",
            "label": "Unsafe",
            "required": false,
            "sbg:altPrefix": "-U",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--unsafe",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "If set, enables unsafe operations: nothing will be checked at runtime.  For expert users only who know what they are doing.  We do not support usage of this argument.",
            "id": "#unsafe",
            "type": [
              "null",
              {
                "type": "enum",
                "symbols": [
                  "ALLOW_UNINDEXED_BAM",
                  "ALLOW_UNSET_BAM_SORT_ORDER",
                  "NO_READ_ORDER_VERIFICATION",
                  "ALLOW_SEQ_DICT_INCOMPATIBILITY",
                  "LENIENT_VCF_PROCESSING",
                  "ALL"
                ],
                "name": "unsafe"
              }
            ]
          },
          {
            "label": "Target Intervals",
            "type": [
              "File"
            ],
            "required": true,
            "sbg:altPrefix": "-targetIntervals",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--targetIntervals",
              "itemSeparator": null
            },
            "sbg:category": "Input Files",
            "sbg:fileTypes": "TXT,INTERVALS",
            "id": "#target_intervals",
            "description": "Intervals file output from RealignerTargetCreator."
          },
          {
            "sbg:toolDefaultValue": "",
            "label": "Tag",
            "required": false,
            "sbg:altPrefix": "-tag",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--tag",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "Arbitrary tag string to identify this GATK run as part of a group of runs, for later analysis.",
            "id": "#tag",
            "type": [
              "null",
              "string"
            ]
          },
          {
            "sbg:toolDefaultValue": "False",
            "label": "Remove Program Records",
            "required": false,
            "sbg:altPrefix": "-rpr",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--remove_program_records",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "Should we override the Walker's default and remove program records from the SAM header.",
            "id": "#remove_program_records",
            "type": [
              "null",
              "boolean"
            ]
          },
          {
            "label": "Reference Genome",
            "type": [
              "File"
            ],
            "required": true,
            "sbg:altPrefix": "-R",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--reference_sequence",
              "itemSeparator": " "
            },
            "sbg:category": "Input Files",
            "sbg:fileTypes": "FASTA, FA",
            "id": "#reference",
            "description": "Reference Genome in FASTA format."
          },
          {
            "label": "Read sequences",
            "type": [
              {
                "type": "array",
                "items": "File",
                "name": "reads"
              }
            ],
            "required": true,
            "sbg:altPrefix": "-I",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "secondaryFiles": [
                ".bai"
              ],
              "prefix": "--input_file",
              "itemSeparator": null
            },
            "sbg:category": "Input Files",
            "sbg:fileTypes": "SAM, BAM",
            "id": "#reads",
            "description": "Read sequences in BAM format."
          },
          {
            "sbg:toolDefaultValue": "[]",
            "label": "Read Group Black List",
            "required": false,
            "sbg:altPrefix": "-rgbl",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--read_group_black_list",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "Filters out read groups matching : or a .txt file containing the filter strings one per line.",
            "id": "#read_group_black_list",
            "type": [
              "null",
              {
                "type": "array",
                "items": "string"
              }
            ]
          },
          {
            "sbg:toolDefaultValue": "[]",
            "label": "Read Filter",
            "required": false,
            "sbg:altPrefix": "-rf",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--read_filter",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "Specify filtration criteria to apply to each read individually.",
            "id": "#read_filter",
            "type": [
              "null",
              {
                "type": "array",
                "items": {
                  "type": "enum",
                  "symbols": [
                    "BadCigarFilter",
                    "BadMateFilter",
                    "CountingFilteringIterator.CountingReadFilter",
                    "DuplicateReadFilter",
                    "FailsVendorQualityCheckFilter",
                    "HCMappingQualityFilter",
                    "LibraryReadFilter",
                    "MalformedReadFilter",
                    "MappingQualityFilter",
                    "MappingQualityUnavailableFilter",
                    "MappingQualityZeroFilter",
                    "MateSameStrandFilter",
                    "MaxInsertSizeFilter",
                    "MissingReadGroupFilter",
                    "NoOriginalQualityScoresFilter",
                    "NotPrimaryAlignmentFilter",
                    "OverclippedReadFilter",
                    "Platform454Filter",
                    "PlatformFilter",
                    "PlatformUnitFilter",
                    "ReadGroupBlackListFilter",
                    "ReadLengthFilter",
                    "ReadNameFilter",
                    "ReadStrandFilter",
                    "ReassignMappingQualityFilter",
                    "ReassignOneMappingQualityFilter",
                    "SampleFilter",
                    "SingleReadGroupFilter",
                    "UnmappedReadFilter"
                  ],
                  "name": "read_filter"
                }
              }
            ]
          },
          {
            "sbg:toolDefaultValue": "6",
            "label": "Preserve Qscores Less Than",
            "required": false,
            "sbg:altPrefix": "-preserveQ",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--preserve_qscores_less_than",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "Bases with quality scores less than this threshold won't be recalibrated (with -BQSR).",
            "id": "#preserve_qscores_less_than",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "STANDARD",
            "label": "Phone Home",
            "required": false,
            "sbg:altPrefix": "-et",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--phone_home",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "What kind of GATK run report should we generate? STANDARD is the default, can be NO_ET so nothing is posted to the run repository. Please see http://gatkforums.broadinstitute.org/discussion/1250/what-is-phone-home-and-how-does-it-affect-me#latest for details.",
            "id": "#phone_home",
            "type": [
              "null",
              {
                "type": "enum",
                "symbols": [
                  "NO_ET",
                  "STANDARD"
                ],
                "name": "phone_home"
              }
            ]
          },
          {
            "sbg:toolDefaultValue": "STRICT",
            "label": "Pedigree Validation Type",
            "required": false,
            "sbg:altPrefix": "-pedValidationType",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--pedigreeValidationType",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "How strict should we be in validating the pedigree information?.",
            "id": "#pedigree_validation_type",
            "type": [
              "null",
              {
                "type": "enum",
                "symbols": [
                  "STRICT",
                  "SILENT"
                ],
                "name": "pedigree_validation_type"
              }
            ]
          },
          {
            "sbg:toolDefaultValue": "[]",
            "label": "Pedigree String",
            "required": false,
            "sbg:altPrefix": "-pedString",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--pedigreeString",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "Pedigree string for samples.",
            "id": "#pedigree_string",
            "type": [
              "null",
              {
                "type": "array",
                "items": "string"
              }
            ]
          },
          {
            "sbg:toolDefaultValue": "False",
            "label": "Non Deterministic Random Seed",
            "required": false,
            "sbg:altPrefix": "-ndrs",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--nonDeterministicRandomSeed",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "Makes the GATK behave non deterministically, that is, the random numbers generated will be different in every run.",
            "id": "#non_deterministic_random_seed",
            "type": [
              "null",
              "boolean"
            ]
          },
          {
            "sbg:toolDefaultValue": "False",
            "label": "No Original Alignment Tags",
            "required": false,
            "sbg:altPrefix": "-noTags",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--noOriginalAlignmentTags",
              "itemSeparator": null
            },
            "sbg:category": "Indel Realigner",
            "description": "Don't output the original cigar or alignment start tags for each realigned read in the output bam.",
            "id": "#no_original_alignment_tags",
            "type": [
              "null",
              "boolean"
            ]
          },
          {
            "sbg:toolDefaultValue": "2048",
            "label": "Memory per job",
            "required": false,
            "sbg:altPrefix": null,
            "id": "#memory_per_job",
            "sbg:category": "Execution",
            "description": "Amount of RAM memory in MB to be used per job.",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "0",
            "label": "Memory overhead per job",
            "required": false,
            "id": "#memory_overhead_per_job",
            "sbg:category": "Execution",
            "description": "Memory overhead per job. By default this parameter value is set to '0' (zero megabytes). This parameter value is added to the Memory per job parameter value. This results in the allocation of the sum total (Memory per job and Memory overhead per job) amount of memory per job. By default the memory per job parameter value is set to 2048 megabytes, unless specified otherwise.",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "MINUTES",
            "label": "Max Runtime Units",
            "required": false,
            "sbg:altPrefix": "-maxRuntimeUnits",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--maxRuntimeUnits",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "The TimeUnit for maxRuntime.",
            "id": "#max_runtime_units",
            "type": [
              "null",
              {
                "type": "enum",
                "symbols": [
                  "NANOSECONDS",
                  "MICROSECONDS",
                  "MILLISECONDS",
                  "SECONDS",
                  "MINUTES",
                  "HOURS",
                  "DAYS"
                ],
                "name": "max_runtime_units"
              }
            ]
          },
          {
            "sbg:toolDefaultValue": "-1",
            "label": "Max Runtime",
            "required": false,
            "sbg:altPrefix": "-maxRuntime",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--maxRuntime",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "If provided, that GATK will stop execution cleanly as soon after maxRuntime has been exceeded, truncating the run but not exiting with a failure.  By default the value is interpreted in minutes, but this can be changed by maxRuntimeUnits.",
            "id": "#max_runtime",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "150000",
            "label": "Max Reads In Memory",
            "required": false,
            "sbg:altPrefix": "-maxInMemory",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--maxReadsInMemory",
              "itemSeparator": null
            },
            "sbg:category": "Indel Realigner",
            "description": "Max reads allowed to be kept in memory at a time by the SAMFileWriter.",
            "id": "#max_reads_in_memory",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "20000",
            "label": "Max Reads For Realignment",
            "required": false,
            "sbg:altPrefix": "-maxReads",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--maxReadsForRealignment",
              "itemSeparator": null
            },
            "sbg:category": "Indel Realigner",
            "description": "Max reads allowed at an interval for realignment.",
            "id": "#max_reads_for_realignment",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "120",
            "label": "Max Reads For Consensuses",
            "required": false,
            "sbg:altPrefix": "-greedy",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--maxReadsForConsensuses",
              "itemSeparator": null
            },
            "sbg:category": "Indel Realigner",
            "description": "Max reads used for finding the alternate consensuses (necessary to improve performance in deep coverage).",
            "id": "#max_reads_for_consensuses",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "200",
            "label": "Max Positional Move Allowed",
            "required": false,
            "sbg:altPrefix": "-maxPosMove",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--maxPositionalMoveAllowed",
              "itemSeparator": null
            },
            "sbg:category": "Indel Realigner",
            "description": "Maximum positional move in basepairs that a read can be adjusted during realignment.",
            "id": "#max_positional_move_allowed",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "3000",
            "label": "Max Isize For Movement",
            "required": false,
            "sbg:altPrefix": "-maxIsize",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--maxIsizeForMovement",
              "itemSeparator": null
            },
            "sbg:category": "Indel Realigner",
            "description": "Maximum insert size of read pairs that we attempt to realign.",
            "id": "#max_isize_for_movement",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "30",
            "label": "Max Consensuses",
            "required": false,
            "sbg:altPrefix": null,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--maxConsensuses",
              "itemSeparator": null
            },
            "sbg:category": "Indel Realigner",
            "description": "Max alternate consensuses to try (necessary to improve performance in deep coverage).",
            "id": "#max_consensuses",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "5.0",
            "label": "Lod Threshold For Cleaning",
            "required": false,
            "sbg:altPrefix": "-LOD",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--LODThresholdForCleaning",
              "itemSeparator": null
            },
            "sbg:category": "Indel Realigner",
            "description": "LOD threshold above which the cleaner will clean.",
            "id": "#lod_threshold_for_cleaning",
            "type": [
              "null",
              "float"
            ]
          },
          {
            "label": "Known Alleles",
            "type": [
              "null",
              {
                "type": "array",
                "items": "File"
              }
            ],
            "required": false,
            "sbg:altPrefix": "-known",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--knownAlleles",
              "itemSeparator": null
            },
            "sbg:category": "Input Files",
            "sbg:fileTypes": "VCF",
            "id": "#known_alleles",
            "description": "Input VCF file(s) with known indels."
          },
          {
            "sbg:toolDefaultValue": "False",
            "label": "Keep Program Records",
            "required": false,
            "sbg:altPrefix": "-kpr",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--keep_program_records",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "Should we override the Walker's default and keep program records from the SAM header.",
            "id": "#keep_program_records",
            "type": [
              "null",
              "boolean"
            ]
          },
          {
            "label": "Intervals",
            "type": [
              "null",
              {
                "type": "array",
                "items": "File",
                "name": "intervals_file"
              }
            ],
            "required": false,
            "sbg:altPrefix": "-L",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "valueFrom": {
                "class": "Expression",
                "script": "{\n  if($job.inputs.intervals_file instanceof Array)\n    if($job.inputs.target_intervals.metadata)\n      if($job.inputs.target_intervals.metadata.intervals_file)\n        return '--intervals ' + $job.inputs.target_intervals.metadata.intervals_file\n  \n  if($job.inputs.intervals_file)\n    return '--intervals ' + $job.inputs.intervals_file.path\n  else\n    return ''\n}",
                "engine": "#cwl-js-engine"
              },
              "itemSeparator": null
            },
            "sbg:category": "Input Files",
            "sbg:fileTypes": "TXT, BED, VCF",
            "id": "#intervals_file",
            "description": "One or more genomic intervals over which to operate. Can be an specified in an .intervals file or a rod file.",
            "sbg:stageInput": "link"
          },
          {
            "sbg:toolDefaultValue": "sample",
            "label": "Intervals",
            "required": false,
            "sbg:altPrefix": null,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-L",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "One or more genomic intervals over which to operate.",
            "id": "#intervals",
            "type": [
              "null",
              "string"
            ]
          },
          {
            "sbg:toolDefaultValue": "UNION",
            "label": "Interval Set Rule",
            "required": false,
            "sbg:altPrefix": "-isr",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--interval_set_rule",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "Indicates the set merging approach the interval parser should use to combine the various -L or -XL inputs.",
            "id": "#interval_set_rule",
            "type": [
              "null",
              {
                "type": "enum",
                "symbols": [
                  "UNION",
                  "INTERSECTION"
                ],
                "name": "interval_set_rule"
              }
            ]
          },
          {
            "sbg:toolDefaultValue": "0",
            "label": "Interval Padding",
            "required": false,
            "sbg:altPrefix": "-ip",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--interval_padding",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "Indicates how many basepairs of padding to include around each of the intervals specified with the -L/--intervals argument.",
            "id": "#interval_padding",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "ALL",
            "label": "Interval Merging",
            "required": false,
            "sbg:altPrefix": "-im",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--interval_merging",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "Indicates the interval merging rule we should use for abutting intervals.",
            "id": "#interval_merging",
            "type": [
              "null",
              {
                "type": "enum",
                "symbols": [
                  "ALL",
                  "OVERLAPPING_ONLY"
                ],
                "name": "interval_merging"
              }
            ]
          },
          {
            "label": "Gatk key",
            "type": [
              "null",
              "File"
            ],
            "required": false,
            "sbg:altPrefix": "-K",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--gatk_key",
              "itemSeparator": " "
            },
            "sbg:category": "Input Files",
            "sbg:fileTypes": "KEY, LICENSE",
            "id": "#gatk_key",
            "description": "GATK Key file. Required if running with -et NO_ET. Please see http://gatkforums.broadinstitute.org/discussion/1250/what-is-phone-home-and-how-does-it-affect-me#latest for details."
          },
          {
            "sbg:toolDefaultValue": "False",
            "label": "Fix Misencoded Quals",
            "required": false,
            "sbg:altPrefix": "-fixMisencodedQuals",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-fixMisencodedQuals",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "Fix mis-encoded base quality scores.",
            "id": "#fix_misencoded_quals",
            "type": [
              "null",
              "boolean"
            ]
          },
          {
            "label": "Exclude Intervals",
            "type": [
              "null",
              "File"
            ],
            "required": false,
            "sbg:altPrefix": "-XL",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--excludeIntervals",
              "itemSeparator": " "
            },
            "sbg:category": "Input Files",
            "sbg:fileTypes": "TXT, BED, VCF",
            "id": "#exclude_intervals",
            "description": "One or more genomic intervals to exclude from processing. Can be an .intervals file or a rod file."
          },
          {
            "sbg:toolDefaultValue": "0.15",
            "label": "Entropy Threshold",
            "required": false,
            "sbg:altPrefix": "-entropy",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--entropyThreshold",
              "itemSeparator": null
            },
            "sbg:category": "Indel Realigner",
            "description": "Percentage of mismatches at a locus to be considered having high entropy.",
            "id": "#entropy_threshold",
            "type": [
              "null",
              "float"
            ]
          },
          {
            "sbg:toolDefaultValue": "False",
            "label": "Emit Original Quals",
            "required": false,
            "sbg:altPrefix": "-EOQ",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--emit_original_quals",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "If true, enables printing of the OQ tag with the original base qualities (with -BQSR).",
            "id": "#emit_original_quals",
            "type": [
              "null",
              "boolean"
            ]
          },
          {
            "sbg:toolDefaultValue": "",
            "label": "Downsampling Type",
            "required": false,
            "sbg:altPrefix": "-dt",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--downsampling_type",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "Type of reads downsampling to employ at a given locus. Reads will be selected randomly to be removed from the pile based on the method described here.",
            "id": "#downsampling_type",
            "type": [
              "null",
              {
                "type": "enum",
                "symbols": [
                  "NONE",
                  "ALL_READS",
                  "BY_SAMPLE"
                ],
                "name": "downsampling_type"
              }
            ]
          },
          {
            "sbg:toolDefaultValue": "",
            "label": "Downsample to Fraction",
            "required": false,
            "sbg:altPrefix": "-dfrac",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--downsample_to_fraction",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "Fraction [0.0-1.0] of reads to downsample to.",
            "id": "#downsample_to_fraction",
            "type": [
              "null",
              "float"
            ]
          },
          {
            "sbg:toolDefaultValue": "",
            "label": "Downsample to Coverage",
            "required": false,
            "sbg:altPrefix": "-dcov",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--downsample_to_coverage",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "Coverage to downsample to at any given locus; note that downsampled reads are randomly selected from all possible reads at a locus. For non-locus-based traversals (eg., ReadWalkers), this sets the maximum number of reads at each alignment start position.",
            "id": "#downsample_to_coverage",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "False",
            "label": "Disable Randomization",
            "required": false,
            "sbg:altPrefix": null,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--disableRandomization",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "Completely eliminates randomization from nondeterministic methods. To be used mostly in the testing framework where dynamic parallelism can result in differing numbers of calls to the generator.",
            "id": "#disable_radnomization",
            "type": [
              "null",
              "boolean"
            ]
          },
          {
            "sbg:toolDefaultValue": "False",
            "label": "Disable Indel Quals",
            "required": false,
            "sbg:altPrefix": "-DIQ",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--disable_indel_quals",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "If 'true', disables printing of base insertion and base deletion tags (with -BQSR). Turns off printing of the base insertion and base deletion tags when using the -BQSR argument and only the base substitution qualities will be produced.",
            "id": "#disable_indel_quals",
            "type": [
              "null",
              "boolean"
            ]
          },
          {
            "sbg:toolDefaultValue": "-1",
            "label": "Default Base Qualities",
            "required": false,
            "sbg:altPrefix": "-DBQ",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--defaultBaseQualities",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "If reads are missing some or all base quality scores, this value will be used for all base quality scores.",
            "id": "#default_base_qualities",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "1",
            "label": "CPU per job",
            "required": false,
            "sbg:altPrefix": null,
            "id": "#cpu_per_job",
            "sbg:category": "Execution",
            "description": "Number of CPUs per job.",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "USE_READS",
            "label": "Consensus Determination Model",
            "required": false,
            "sbg:altPrefix": "-model",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--consensusDeterminationModel",
              "itemSeparator": null
            },
            "sbg:category": "Indel Realigner",
            "description": "Determines how to compute the possible alternate consenses.",
            "id": "#consensus_determination_model",
            "type": [
              "null",
              {
                "type": "enum",
                "symbols": [
                  "KNOWNS_ONLY",
                  "USE_READS",
                  "USE_SW"
                ],
                "name": "consensus_determination_model"
              }
            ]
          },
          {
            "sbg:toolDefaultValue": "40.0",
            "label": "BAQ Gap Open Penalty",
            "required": false,
            "sbg:altPrefix": "-baqGOP",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--baqGapOpenPenalty",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "BAQ gap open penalty (Phred Scaled). Default value is 40. 30 is perhaps better for whole genome call sets.",
            "id": "#baq_gap_open_penalty",
            "type": [
              "null",
              "float"
            ]
          },
          {
            "sbg:toolDefaultValue": "OFF",
            "label": "BAQ Calculation Type",
            "required": false,
            "sbg:altPrefix": "-baq",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--baq",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "Type of BAQ calculation to apply in the engine.",
            "id": "#baq",
            "type": [
              "null",
              {
                "type": "enum",
                "symbols": [
                  "OFF",
                  "CALCULATE_AS_NECESSARY",
                  "RECALCULATE"
                ],
                "name": "baq"
              }
            ]
          },
          {
            "sbg:toolDefaultValue": "False",
            "label": "Allow Potentially Misencoded Quals",
            "required": false,
            "sbg:altPrefix": "--allow_potentially_misencoded_quality_scores",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-allowPotentiallyMisencodedQuals",
              "itemSeparator": null
            },
            "sbg:category": "GATK General",
            "description": "Do not fail when encountered base qualities that are too high and seemingly indicate a problem with the base quality encoding of the BAM file.",
            "id": "#allow_potentailly_misencoded_quals",
            "type": [
              "null",
              "boolean"
            ]
          }
        ],
        "sbg:toolkit": "GATK",
        "appUrl": "/public/apps/#tool/admin/sbg-public-data/gatk-2-3-9-lite-indelrealigner/10",
        "sbg:createdOn": 1447844103,
        "sbg:toolkitVersion": "2.3.9 Lite",
        "stdout": "",
        "sbg:project": "admin/sbg-public-data",
        "sbg:revision": 10,
        "sbg:license": "MIT License",
        "sbg:job": {
          "allocatedResources": {
            "cpu": 1,
            "mem": 3048
          },
          "inputs": {
            "reference": {
              "path": "/folder/reference.fasta"
            },
            "intervals_file": [
              {
                "size": 0,
                "class": "File",
                "secondaryFiles": [],
                "path": "/path/to/intervals_file-1.ext"
              },
              {
                "size": 0,
                "class": "File",
                "secondaryFiles": [],
                "path": "/path/to/intervals_file-2.ext"
              }
            ],
            "intervals": "",
            "known_alleles": [
              {
                "path": "/folder/indels.vcf"
              }
            ],
            "memory_per_job": null,
            "memory_overhead_per_job": 1000,
            "reads": [
              {
                "path": "/folder/input.bam"
              }
            ],
            "target_intervals": {
              "size": 0,
              "class": "File",
              "secondaryFiles": [],
              "path": "intervalListFromRTC.intervals",
              "metadata": {
                "intervals_file": "treterfgsdfsd.4444"
              }
            }
          }
        },
        "class": "CommandLineTool",
        "x": 1302.1429474013198,
        "sbg:cmdPreview": "java -Xmx2048M -jar /opt/GenomeAnalysisTKLite.jar --analysis_type IndelRealigner --reference_sequence /folder/reference.fasta --input_file /folder/input.bam --targetIntervals intervalListFromRTC.intervals --out intervalListFromRTC.realigned.bam",
        "sbg:validationErrors": [],
        "sbg:toolAuthor": "Broad Institute",
        "sbg:revisionsInfo": [
          {
            "sbg:modifiedBy": "sanja.mijalkovic",
            "sbg:revisionNotes": null,
            "sbg:modifiedOn": 1447844103,
            "sbg:revision": 0
          },
          {
            "sbg:modifiedBy": "aleksandar.mihajlovic",
            "sbg:revisionNotes": null,
            "sbg:modifiedOn": 1447866202,
            "sbg:revision": 1
          },
          {
            "sbg:modifiedBy": "aleksandar.mihajlovic",
            "sbg:revisionNotes": null,
            "sbg:modifiedOn": 1448043234,
            "sbg:revision": 2
          },
          {
            "sbg:modifiedBy": "djordje_klisic",
            "sbg:revisionNotes": null,
            "sbg:modifiedOn": 1454681650,
            "sbg:revision": 3
          },
          {
            "sbg:modifiedBy": "djordje_klisic",
            "sbg:revisionNotes": null,
            "sbg:modifiedOn": 1461762512,
            "sbg:revision": 4
          },
          {
            "sbg:modifiedBy": "admin",
            "sbg:revisionNotes": "Scatter metadata support.",
            "sbg:modifiedOn": 1473165032,
            "sbg:revision": 5
          },
          {
            "sbg:modifiedBy": "admin",
            "sbg:revisionNotes": "metadata scatter 2",
            "sbg:modifiedOn": 1473165032,
            "sbg:revision": 6
          },
          {
            "sbg:modifiedBy": "admin",
            "sbg:revisionNotes": "scatter metadata 3",
            "sbg:modifiedOn": 1473165032,
            "sbg:revision": 7
          },
          {
            "sbg:modifiedBy": "admin",
            "sbg:revisionNotes": ".bai as secondary.",
            "sbg:modifiedOn": 1473165032,
            "sbg:revision": 8
          },
          {
            "sbg:modifiedBy": "admin",
            "sbg:revisionNotes": "output single file.",
            "sbg:modifiedOn": 1473165032,
            "sbg:revision": 9
          },
          {
            "sbg:modifiedBy": "admin",
            "sbg:revisionNotes": "Added support for run without intervals",
            "sbg:modifiedOn": 1476440186,
            "sbg:revision": 10
          }
        ],
        "baseCommand": [
          "java",
          {
            "class": "Expression",
            "script": "{   \n  if($job.inputs.memory_per_job){\n    return '-Xmx'.concat($job.inputs.memory_per_job, 'M')\n  }   \n  \treturn '-Xmx2048M'\n}",
            "engine": "#cwl-js-engine"
          },
          "-jar",
          "/opt/GenomeAnalysisTKLite.jar",
          "--analysis_type",
          "IndelRealigner"
        ],
        "requirements": [
          {
            "requirements": [
              {
                "dockerPull": "rabix/js-engine",
                "class": "DockerRequirement"
              }
            ],
            "class": "ExpressionEngineRequirement",
            "id": "#cwl-js-engine"
          }
        ],
        "sbg:contributors": [
          "djordje_klisic",
          "sanja.mijalkovic",
          "admin",
          "aleksandar.mihajlovic"
        ],
        "sbg:links": [
          {
            "label": "Homepage",
            "id": "https://www.broadinstitute.org/gatk/index.php"
          },
          {
            "label": "Source code",
            "id": "https://github.com/broadgsa/gatk-protected"
          },
          {
            "label": "Wiki",
            "id": "https://www.broadinstitute.org/gatk/guide/pdfdocs/GATK_GuideBook_2.3-9.pdf"
          },
          {
            "label": "Download",
            "id": "https://www.broadinstitute.org/gatk/download/auth?package=GATK-archive&version=2.3-9-ge5ebf34"
          },
          {
            "label": "Publication",
            "id": "https://www.broadinstitute.org/gatk/about/#in-the-literature"
          },
          {
            "label": "Documentation",
            "id": "https://www.broadinstitute.org/gatk/gatkdocs/org_broadinstitute_gatk_tools_walkers_indels_IndelRealigner.php"
          }
        ],
        "sbg:id": "admin/sbg-public-data/gatk-2-3-9-lite-indelrealigner/10",
        "id": "admin/sbg-public-data/gatk-2-3-9-lite-indelrealigner/10",
        "arguments": [
          {
            "separate": true,
            "valueFrom": {
              "class": "Expression",
              "script": "{\n  read_name = [].concat($job.inputs.target_intervals)[0].path.replace(/^.*[\\\\\\/]/, '').split('.')\n  read_namebase = read_name.slice(0, read_name.length-1).join('.')\n  return read_namebase + '.realigned.bam'\n}",
              "engine": "#cwl-js-engine"
            },
            "prefix": "--out"
          }
        ],
        "sbg:latestRevision": 10,
        "hints": [
          {
            "dockerPull": "images.sbgenomics.com/stefanristeski/gatk2-lite:2.3-9",
            "class": "DockerRequirement",
            "dockerImageId": "47510cb2da55"
          },
          {
            "class": "sbg:CPURequirement",
            "value": {
              "class": "Expression",
              "script": "{\n  if($job.inputs.cpu_per_job){\n  \treturn $job.inputs.cpu_per_job\n  }\n\treturn 1\n}",
              "engine": "#cwl-js-engine"
            }
          },
          {
            "class": "sbg:MemRequirement",
            "value": {
              "class": "Expression",
              "script": "{\n  if($job.inputs.memory_per_job){\n    if($job.inputs.memory_overhead_per_job){\n    \treturn $job.inputs.memory_per_job + $job.inputs.memory_overhead_per_job\n    }\n    else\n  \t\treturn $job.inputs.memory_per_job\n  }\n  else if(!$job.inputs.memory_per_job && $job.inputs.memory_overhead_per_job){\n\t\treturn 2048 + $job.inputs.memory_overhead_per_job  \n  }\n  else\n  \treturn 2048\n}",
              "engine": "#cwl-js-engine"
            }
          }
        ],
        "sbg:image_url": null,
        "description": "Overview\n\nThe local realignment process is designed to consume one or more BAM files and to locally realign reads such that the number of mismatching bases is minimized across all the reads. In general, a large percent of regions requiring local realignment are due to the presence of an insertion or deletion (indels) in the individual's genome with respect to the reference genome. Such alignment artifacts result in many bases mismatching the reference near the misalignment, which are easily mistaken as SNPs. Moreover, since read mapping algorithms operate on each read independently, it is impossible to place reads on the reference genome such at mismatches are minimized across all reads. Consequently, even when some reads are correctly mapped with indels, reads covering the indel near just the start or end of the read are often incorrectly mapped with respect the true indel, also requiring realignment. Local realignment serves to transform regions with misalignments due to indels into clean reads containing a consensus indel suitable for standard variant discovery approaches. Unlike most mappers, this walker uses the full alignment context to determine whether an appropriate alternate reference (i.e. indel) exists. Following local realignment, the GATK tool Unified Genotyper can be used to sensitively and specifically identify indels.\n\nThere are 2 steps to the realignment process:\n\n1. Determining (small) suspicious intervals which are likely in need of realignment (see the RealignerTargetCreator tool)\n2. Running the realigner over those intervals (IndelRealigner)\nFor more details, see the indel realignment method documentation.\n\nInput\nOne or more aligned BAM files and optionally one or more lists of known indels.\n\nOutput\nA realigned version of your input BAM file(s).\n\nUsage example:\n java -jar GenomeAnalysisTK.jar \\\n   -T IndelRealigner \\\n   -R reference.fasta \\\n   -I input.bam \\\n   --known indels.vcf \\\n   -targetIntervals intervalListFromRTC.intervals \\\n   -o realignedBam.bam\n \nCaveats\n\nThe input BAM(s), reference, and known indel file(s) should be the same ones to be used for the IndelRealigner step.\nBecause reads produced from the 454 technology inherently contain false indels, the realigner will not work with them (or with reads from similar technologies).\nThis tool also ignores MQ0 reads and reads with consecutive indel operators in the CIGAR string.\n\n(IMPORTANT) Reference \".fasta\" Secondary Files\n\nTools in GATK that require a fasta reference file also look for the reference file's corresponding .fai (fasta index) and .dict (fasta dictionary) files. The fasta index file allows random access to reference bases and the dictionary file is a dictionary of the contig names and sizes contained within the fasta reference. These two secondary files are essential for GATK to work properly. To append these two files to your fasta reference please use the 'SBG FASTA Indices' tool within your GATK based workflow before using any of the GATK tools.",
        "sbg:sbgMaintained": false,
        "sbg:createdBy": "sanja.mijalkovic",
        "label": "GATK IndelRealigner",
        "successCodes": [],
        "sbg:revisionNotes": "Added support for run without intervals",
        "sbg:categories": [
          "Alignment"
        ],
        "y": 146.22233115951536,
        "sbg:modifiedOn": 1476440186
      },
      "inputs": [
        {
          "id": "#GATK_IndelRealigner.validation_strictness"
        },
        {
          "id": "#GATK_IndelRealigner.use_original_qualities"
        },
        {
          "id": "#GATK_IndelRealigner.use_legacy_downsampler"
        },
        {
          "id": "#GATK_IndelRealigner.unsafe"
        },
        {
          "id": "#GATK_IndelRealigner.target_intervals",
          "source": [
            "#target_intervals"
          ]
        },
        {
          "id": "#GATK_IndelRealigner.tag"
        },
        {
          "id": "#GATK_IndelRealigner.remove_program_records"
        },
        {
          "id": "#GATK_IndelRealigner.reference",
          "source": [
            "#SBG_FASTA_Indices.fasta_reference"
          ]
        },
        {
          "id": "#GATK_IndelRealigner.reads",
          "source": [
            "#Picard_BuildBamIndex.indexed_bam"
          ]
        },
        {
          "id": "#GATK_IndelRealigner.read_group_black_list"
        },
        {
          "id": "#GATK_IndelRealigner.read_filter"
        },
        {
          "id": "#GATK_IndelRealigner.preserve_qscores_less_than"
        },
        {
          "id": "#GATK_IndelRealigner.phone_home"
        },
        {
          "id": "#GATK_IndelRealigner.pedigree_validation_type"
        },
        {
          "id": "#GATK_IndelRealigner.pedigree_string"
        },
        {
          "id": "#GATK_IndelRealigner.non_deterministic_random_seed"
        },
        {
          "id": "#GATK_IndelRealigner.no_original_alignment_tags"
        },
        {
          "id": "#GATK_IndelRealigner.memory_per_job"
        },
        {
          "id": "#GATK_IndelRealigner.memory_overhead_per_job"
        },
        {
          "id": "#GATK_IndelRealigner.max_runtime_units"
        },
        {
          "id": "#GATK_IndelRealigner.max_runtime"
        },
        {
          "id": "#GATK_IndelRealigner.max_reads_in_memory"
        },
        {
          "id": "#GATK_IndelRealigner.max_reads_for_realignment"
        },
        {
          "id": "#GATK_IndelRealigner.max_reads_for_consensuses"
        },
        {
          "id": "#GATK_IndelRealigner.max_positional_move_allowed"
        },
        {
          "id": "#GATK_IndelRealigner.max_isize_for_movement"
        },
        {
          "id": "#GATK_IndelRealigner.max_consensuses"
        },
        {
          "id": "#GATK_IndelRealigner.lod_threshold_for_cleaning"
        },
        {
          "id": "#GATK_IndelRealigner.known_alleles"
        },
        {
          "id": "#GATK_IndelRealigner.keep_program_records"
        },
        {
          "id": "#GATK_IndelRealigner.intervals_file"
        },
        {
          "id": "#GATK_IndelRealigner.intervals"
        },
        {
          "id": "#GATK_IndelRealigner.interval_set_rule"
        },
        {
          "id": "#GATK_IndelRealigner.interval_padding"
        },
        {
          "id": "#GATK_IndelRealigner.interval_merging"
        },
        {
          "id": "#GATK_IndelRealigner.gatk_key"
        },
        {
          "id": "#GATK_IndelRealigner.fix_misencoded_quals"
        },
        {
          "id": "#GATK_IndelRealigner.exclude_intervals"
        },
        {
          "id": "#GATK_IndelRealigner.entropy_threshold"
        },
        {
          "id": "#GATK_IndelRealigner.emit_original_quals"
        },
        {
          "id": "#GATK_IndelRealigner.downsampling_type"
        },
        {
          "id": "#GATK_IndelRealigner.downsample_to_fraction"
        },
        {
          "id": "#GATK_IndelRealigner.downsample_to_coverage"
        },
        {
          "id": "#GATK_IndelRealigner.disable_radnomization"
        },
        {
          "id": "#GATK_IndelRealigner.disable_indel_quals"
        },
        {
          "id": "#GATK_IndelRealigner.default_base_qualities"
        },
        {
          "id": "#GATK_IndelRealigner.cpu_per_job"
        },
        {
          "id": "#GATK_IndelRealigner.consensus_determination_model"
        },
        {
          "id": "#GATK_IndelRealigner.baq_gap_open_penalty"
        },
        {
          "id": "#GATK_IndelRealigner.baq"
        },
        {
          "id": "#GATK_IndelRealigner.allow_potentailly_misencoded_quals"
        }
      ],
      "outputs": [
        {
          "id": "#GATK_IndelRealigner.realigned_bam_file"
        }
      ],
      "sbg:x": 1302.1429474013198,
      "sbg:y": 146.22233115951536
    },
    {
      "id": "#Freebayes",
      "run": {
        "stdin": "",
        "sbg:modifiedBy": "Durga",
        "outputs": [
          {
            "label": "Variants",
            "outputBinding": {
              "sbg:inheritMetadataFrom": "#bams",
              "glob": {
                "class": "Expression",
                "script": "{\n  if($job.inputs.gvcf)\n  {\n    if($job.inputs.bams instanceof Array && $job.inputs.bams.length>1)\n    {\n      filename=$job.inputs.bams[0].path\n      paths=filename.split('/')\n      names=filename.split('/')[paths.length-1].split('.')\n      names[names.length-1]='and_more.freebayes.g.vcf'\n      return names.join('.')\n    }\n    filename=''\n  \tif ($job.inputs.bams instanceof Array)\n      filename = $job.inputs.bams[0].path\n    else\n      filename = $job.inputs.bams.path\n    \n    paths=filename.split('/')\n    names=filename.split('/')[paths.length-1].split('.')\n    names[names.length-1]='freebayes.g.vcf'\n    return names.join(\".\")\n  }\n  if ($job.inputs.VCF){\n    return $job.inputs.VCF + \".freebayes.vcf\"\n  }\n\tif ($job.inputs.bams instanceof Array && $job.inputs.bams.length>1) {\n  \t\tfilename = $job.inputs.bams[0].path\n  \t\tpaths = filename.split('/')\n  \t\tnames = filename.split('/')[paths.length-1].split('.')\n  \t\tnames[names.length-1] = 'and_more.freebayes.vcf'\n  \t\treturn names.join(\".\")\n\t}\n\tfilename=''\n  \tif ($job.inputs.bams instanceof Array)\n      filename = $job.inputs.bams[0].path\n    else\n      filename = $job.inputs.bams.path\n\t\n\tpaths = filename.split('/')\n\tnames = filename.split('/')[paths.length-1].split('.')\n\tnames[names.length-1] = 'freebayes.vcf'\n \treturn names.join(\".\")\n}\n  ",
                "engine": "#cwl-js-engine"
              }
            },
            "id": "#variants",
            "type": [
              "null",
              "File"
            ],
            "sbg:fileTypes": "VCF, G.VCF",
            "description": "VCF or GVCF file with the variant calls."
          }
        ],
        "temporaryFailCodes": [],
        "inputs": [
          {
            "label": "Variant input",
            "type": [
              "null",
              "File"
            ],
            "required": false,
            "sbg:altPrefix": "--variant-input",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "secondaryFiles": [
                ".tbi"
              ],
              "prefix": "-@"
            },
            "sbg:category": "Outputs",
            "sbg:fileTypes": "VCF.GZ",
            "id": "#variant_input",
            "description": "Use variants reported in VCF file as input to the algorithm. Variants in this file will included in the output even if there is not enough support in the data to pass input filters."
          },
          {
            "label": "Use reference allele",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "sbg:altPrefix": "--use-reference-allele",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-Z"
            },
            "sbg:category": "Reference allele",
            "description": "This flag includes the reference allele in the analysis as if it is another sample from the same population.",
            "id": "#use_reference_allele"
          },
          {
            "label": "Use mapping quality",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "sbg:altPrefix": "--use-mapping-quality",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-j"
            },
            "sbg:category": "Algorithmic features",
            "description": "Use mapping quality of alleles when calculating data likelihoods.",
            "id": "#use_mapping_quality"
          },
          {
            "label": "Use duplicate reads",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "sbg:altPrefix": "--use-duplicate-reads",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-4"
            },
            "sbg:category": "Input filters",
            "description": "Include duplicate-marked alignments in the analysis.",
            "id": "#use_duplicate_reads"
          },
          {
            "sbg:toolDefaultValue": "0",
            "label": "Use best n alleles",
            "required": false,
            "sbg:altPrefix": "--use-best-n-alleles",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-n"
            },
            "sbg:category": "Allele scope",
            "description": "Evaluate only the best N SNP alleles, ranked by sum of supporting quality scores.",
            "id": "#use_best_n_alleles",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "0.001",
            "label": "Theta",
            "required": false,
            "sbg:altPrefix": "--theta",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-T"
            },
            "sbg:category": "Population model",
            "description": "The expected mutation rate or pairwise nucleotide diversity among the population under analysis. This serves as the single parameter to the Ewens Sampling Formula prior model default: 0.001.",
            "id": "#theta",
            "type": [
              "null",
              "float"
            ]
          },
          {
            "label": "Standard filters",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "sbg:altPrefix": "--standard-filters",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-0"
            },
            "sbg:category": "Input filters",
            "description": "Use stringent input base and mapping quality filters. Equivalent to -m 30 -q 20 -R 0 -S 0.",
            "id": "#standard_filters"
          },
          {
            "label": "Samples",
            "type": [
              "null",
              "File"
            ],
            "required": false,
            "sbg:altPrefix": "--samples",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-s"
            },
            "sbg:category": "Inputs",
            "sbg:fileTypes": "TXT",
            "id": "#samples",
            "description": "Limit analysis to samples listed (one per line) in the FILE. By default FreeBayes will analyze all samples in its input BAM files."
          },
          {
            "label": "Report monomorphic",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "id": "#report_monomorphic",
            "sbg:category": "Outputs",
            "description": "Report even loci which appear to be monomorphic, and report all considered alleles, even those which are not in called genotypes. Loci which do not have any potential alternates have '.' for ALT.",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--report-monomorphic"
            }
          },
          {
            "label": "Report genotype likelihood max",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "id": "#report_genotype_likelihood_max",
            "sbg:category": "Algorithmic features",
            "description": "Report genotypes using the maximum-likelihood estimate provided from genotype likelihoods.",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--report-genotype-likelihood-max"
            }
          },
          {
            "label": "Report all haplotype alleles",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "id": "#report_all_haplotype_alleles",
            "sbg:category": "Outputs",
            "description": "At sites where genotypes are made over haplotype alleles, provide information about all alleles in output, not only those which are called.",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--report-all-haplotype-alleles"
            }
          },
          {
            "label": "Region",
            "type": [
              "null",
              "string"
            ],
            "required": false,
            "sbg:altPrefix": "--region",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-r"
            },
            "sbg:category": "Inputs",
            "description": "Limit analysis to the specified region, 0-base coordinates, end_position not included.",
            "id": "#region_chr_stpos_endpos"
          },
          {
            "label": "Region",
            "type": [
              "null",
              "File"
            ],
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-t"
            },
            "sbg:category": "Inputs",
            "description": "BED file with the region to process.",
            "id": "#region",
            "sbg:fileTypes": "BED"
          },
          {
            "sbg:toolDefaultValue": "100,60",
            "label": "Reference quality",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--reference-quality",
              "itemSeparator": ","
            },
            "sbg:category": "Reference allele",
            "description": "Assign mapping quality of MQ to the reference allele at each site and base quality of BQ (default: 100,60).",
            "id": "#reference_quality",
            "type": [
              "null",
              {
                "type": "array",
                "items": "int",
                "name": "reference_quality"
              }
            ]
          },
          {
            "label": "Reference",
            "type": [
              "File"
            ],
            "required": true,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-f"
            },
            "sbg:category": "Inputs",
            "description": "The reference files in FASTA format.",
            "id": "#reference",
            "sbg:fileTypes": "FASTA"
          },
          {
            "sbg:toolDefaultValue": "unbounded",
            "label": "Read snp limit",
            "required": false,
            "sbg:altPrefix": "--read-snp-limit",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-$"
            },
            "sbg:category": "Input filters",
            "description": "Exclude reads with more than N base mismatches, ignoring gaps with quality >= mismatch-base-quality-threshold.",
            "id": "#read_snp_limit",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "unbounded",
            "label": "Read mismatch limit",
            "required": false,
            "sbg:altPrefix": "--read-mismatch-limit",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-U"
            },
            "sbg:category": "Input filters",
            "description": "Exclude reads with more than N mismatches where each mismatch has base quality >= mismatch-base-quality-threshold.",
            "id": "#read_mismatch_limit",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "1",
            "label": "Read max mismatch fraction",
            "required": false,
            "sbg:altPrefix": "--read-max-mismatch-fraction",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-z"
            },
            "sbg:category": "Input filters",
            "description": "Exclude reads with more than N [0,1] fraction of mismatches where each mismatch has base quality >= mismatch-base-quality-threshold.",
            "id": "#read_max_mismatch_fraction",
            "type": [
              "null",
              "float"
            ]
          },
          {
            "sbg:toolDefaultValue": "unbounded",
            "label": "Read indel limit",
            "required": false,
            "sbg:altPrefix": "--read-indel-limit",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-e"
            },
            "sbg:category": "Input filters",
            "description": "Exclude reads with more than N separate gaps.",
            "id": "#read_indel_limit",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "0.9",
            "label": "Read dependence factor",
            "required": false,
            "sbg:altPrefix": "--read-dependence-factor",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-D"
            },
            "sbg:category": "Algorithmic features",
            "description": "Incorporate non-independence of reads by scaling successive observations by this factor during data likelihood calculations.",
            "id": "#read_dependence_factor",
            "type": [
              "null",
              "float"
            ]
          },
          {
            "sbg:toolDefaultValue": "0",
            "label": "Pvar",
            "required": false,
            "sbg:altPrefix": "--pvar",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-p"
            },
            "sbg:category": "Outputs",
            "description": "Report sites if the probability that there is a polymorphism at the site is greater than N.  default: 0.0.  Note that post-filtering is generally recommended over the use of this parameter.",
            "id": "#pvar",
            "type": [
              "null",
              "float"
            ]
          },
          {
            "sbg:toolDefaultValue": "10e-9",
            "label": "Prob contamination",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--prob-contamination"
            },
            "sbg:category": "Genotype likelihoods",
            "description": "An estimate of contamination to use for all samples.",
            "id": "#prob_contamination",
            "type": [
              "null",
              "float"
            ]
          },
          {
            "sbg:toolDefaultValue": "1,3",
            "label": "Posterior integration limits",
            "required": false,
            "sbg:altPrefix": "--posterior-integration-limits",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-W",
              "itemSeparator": ","
            },
            "sbg:category": "Algorithmic features",
            "description": "Integrate all genotype combinations in our posterior space which include no more than N samples with their Mth best data likelihood.",
            "id": "#posterior_integration_limits",
            "type": [
              "null",
              {
                "type": "array",
                "items": "int",
                "name": "posterior_integration_limits"
              }
            ],
            "sbg:stageInput": null
          },
          {
            "label": "Populations",
            "type": [
              "null",
              "File"
            ],
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--populations"
            },
            "sbg:category": "Inputs",
            "description": "Each line of FILE should list a sample and a population which it is part of.  The population-based bayesian inference model will then be partitioned on the basis of the populations.",
            "id": "#populations",
            "sbg:fileTypes": "NO_EXTENSION"
          },
          {
            "label": "Pooled discrete",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "sbg:altPrefix": "--pooled-discrete",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-J"
            },
            "sbg:category": "Population model",
            "description": "Assume that samples result from pooled sequencing. Model pooled samples using discrete genotypes across pools. When using this flag, set --ploidy to the number of alleles in each sample or use the --cnv-map to define per-sample ploidy.",
            "id": "#pooled_discrete"
          },
          {
            "label": "Pooled continuous",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "sbg:altPrefix": "--pooled-continuous",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-K"
            },
            "sbg:category": "Population model",
            "description": "Output all alleles which pass input filters, regardles of genotyping outcome or model.",
            "id": "#pooled_continuous"
          },
          {
            "sbg:toolDefaultValue": "2",
            "label": "Ploidy",
            "required": false,
            "sbg:altPrefix": "--ploidy",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-p"
            },
            "sbg:category": "Population model",
            "description": "Sets the default ploidy for the analysis to N.",
            "id": "#ploidy",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "label": "Only use input alleles",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "sbg:altPrefix": "--only-use-input-alleles",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-l"
            },
            "sbg:category": "Outputs",
            "description": "Only provide variant calls and genotype likelihoods for sites and alleles which are provided in the VCF input, and provide output in the VCF for all input alleles, not just those which have support in the data.",
            "id": "#only_use_input_alleles"
          },
          {
            "label": "Observation bias",
            "type": [
              "null",
              "File"
            ],
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--observation-bias"
            },
            "sbg:category": "Genotype likelihoods",
            "description": "Read length-dependent allele observation biases from FILE. The format is [length] [alignment efficiency relative to reference] where the efficiency is 1 if there is no relative observation bias.",
            "id": "#observation_bias",
            "sbg:fileTypes": "NO_EXTENSION"
          },
          {
            "label": "No snps",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "sbg:altPrefix": "--no-snps",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-I"
            },
            "sbg:category": "Allele scope",
            "description": "Ignore SNP alleles.",
            "id": "#no_snps"
          },
          {
            "label": "No population priors",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "sbg:altPrefix": "--no-population-priors",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-k"
            },
            "sbg:category": "Population priors",
            "description": "Equivalent to --pooled-discrete --hwe-priors-off and removal of  Ewens Sampling Formula component of priors.",
            "id": "#no_population_priors"
          },
          {
            "label": "No partial observations",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "id": "#no_partial_observations",
            "sbg:category": "Allele scope",
            "description": "Exclude observations which do not fully span the dynamically-determined detection window.",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--no-partial-observations"
            }
          },
          {
            "label": "No mnps",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "sbg:altPrefix": "--no-mnps",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-X"
            },
            "sbg:category": "Allele scope",
            "description": "Ignore multi-nuceotide polymorphisms, MNPs.",
            "id": "#no_mnps"
          },
          {
            "label": "No indels",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "sbg:altPrefix": "--no-indels",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-i"
            },
            "sbg:category": "Allele scope",
            "description": "Ignore insertion and deletion alleles.",
            "id": "#no_indels"
          },
          {
            "label": "No complex",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "sbg:altPrefix": "--no-complex",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-u"
            },
            "sbg:category": "Allele scope",
            "description": "Ignore complex events (composites of other classes).",
            "id": "#no_complex"
          },
          {
            "sbg:toolDefaultValue": "10",
            "label": "Mismatch base quality threshold",
            "required": false,
            "sbg:altPrefix": "--mismatch-base-quality-threshold",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-Q"
            },
            "sbg:category": "Input filters",
            "description": "Count mismatches toward --read-mismatch-limit if the base quality of the mismatch is >= Q.",
            "id": "#mismatch_base_quality_threshold",
            "type": [
              "null",
              "float"
            ]
          },
          {
            "sbg:toolDefaultValue": "0",
            "label": "Min supporting mapping qsum",
            "required": false,
            "sbg:altPrefix": "--min-supporting-mapping-qsum",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-Y"
            },
            "sbg:category": "Input filters",
            "description": "Consider any allele in which and the sum of mapping qualities of supporting reads is at least Q.",
            "id": "#min_supporting_mapping_qsum",
            "type": [
              "null",
              "float"
            ]
          },
          {
            "sbg:toolDefaultValue": "0",
            "label": "Min supporting allele qsum",
            "required": false,
            "sbg:altPrefix": "--min-supporting-allele-qsum",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-R"
            },
            "sbg:category": "Input filters",
            "description": "Consider any allele in which the sum of qualities of supporting observations is at least Q.",
            "id": "#min_supporting_allele_qsum",
            "type": [
              "null",
              "float"
            ]
          },
          {
            "sbg:toolDefaultValue": "5",
            "label": "Min repeat size",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--min-repeat-size"
            },
            "sbg:category": "Allele scope",
            "description": "When assembling observations across repeats, require the total repeat length at least this many bp.",
            "id": "#min_repeat_size",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "0",
            "label": "Min repeat entropy",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--min-repeat-entropy"
            },
            "sbg:category": "Allele scope",
            "description": "To detect interrupted repeats, build across sequence until it has entropy > N bits per bp.",
            "id": "#min_repeat_entropy",
            "type": [
              "null",
              "float"
            ]
          },
          {
            "sbg:toolDefaultValue": "1",
            "label": "Min mapping quality",
            "required": false,
            "sbg:altPrefix": "--min-mapping-quality",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-m"
            },
            "sbg:category": "Input filters",
            "description": "Exclude alignments from analysis if they have a mapping quality less than Q.",
            "id": "#min_mapping_quality",
            "type": [
              "null",
              "float"
            ]
          },
          {
            "sbg:toolDefaultValue": "0",
            "label": "Min coverage",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--min-coverage"
            },
            "sbg:category": "Input filters",
            "description": "Require at least this coverage to process a site.",
            "id": "#min_coverage",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "0",
            "label": "Min base quality",
            "required": false,
            "sbg:altPrefix": "--min-base-quality",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-q"
            },
            "sbg:category": "Input filters",
            "description": "Exclude alleles from analysis if their supporting base quality is less than Q.",
            "id": "#min_base_quality",
            "type": [
              "null",
              "float"
            ]
          },
          {
            "sbg:toolDefaultValue": "1",
            "label": "Min alternate total",
            "required": false,
            "sbg:altPrefix": "min-alternate-total",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-G"
            },
            "sbg:category": "Input filters",
            "description": "Require at least this count of observations supporting an alternate allele within the total population in order to use the allele in analysis.",
            "id": "#min_alternate_total",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "0",
            "label": "Min alternate qsum",
            "required": false,
            "sbg:altPrefix": "--min-alternate-qsum",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-3"
            },
            "sbg:category": "Input filters",
            "description": "Require at least this sum of quality of observations supporting an alternate allele within a single individual in order to evaluate the position.",
            "id": "#min_alternate_qsum",
            "type": [
              "null",
              "float"
            ]
          },
          {
            "sbg:toolDefaultValue": "0.2",
            "label": "Min alternate fraction",
            "required": false,
            "sbg:altPrefix": "--min-alternate-fraction",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-F"
            },
            "sbg:category": "Input filters",
            "description": "Require at least this fraction of observations supporting an alternate allele within a single individual in the in order to evaluate the position.",
            "id": "#min_alternate_fraction",
            "type": [
              "null",
              "float"
            ]
          },
          {
            "sbg:toolDefaultValue": "2",
            "label": "Min alternate count",
            "required": false,
            "sbg:altPrefix": "--min-alternate-count",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-C"
            },
            "sbg:category": "Input filters",
            "description": "Require at least this count of observations supporting an alternate allele within a single individual in order to evaluate the position.",
            "id": "#min_alternate_count",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "no limit",
            "label": "Max coverage",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--max-coverage"
            },
            "sbg:category": "Input filters",
            "description": "Do not process sites with greater than this coverage.",
            "id": "#max_coverage",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "label": "Max complex gap",
            "type": [
              "null",
              "int"
            ],
            "required": false,
            "sbg:altPrefix": "--max-complex-gap",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-E"
            },
            "sbg:category": "Allele scope",
            "description": "Maximum complex gap.",
            "id": "#max_complex_gap"
          },
          {
            "label": "Legacy gls",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "id": "#legacy_gls",
            "sbg:category": "Genotype likelihoods",
            "description": "Use legacy (polybayes equivalent) genotype likelihood calculations.",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--legacy-gls"
            }
          },
          {
            "label": "Hwe priors off",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "sbg:altPrefix": "--hwe-priors-off",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-w"
            },
            "sbg:category": "Mappability priors",
            "description": "Disable estimation of the probability of the combination arising under HWE given the allele frequency as estimated by observation frequency.",
            "id": "#hwe_priors_off"
          },
          {
            "label": "Harmonic indel quality",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "sbg:altPrefix": "--harmonic-indel-quality",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-H"
            },
            "sbg:category": "Algorithmic features",
            "description": "Use a weighted sum of base qualities around an indel, scaled by the distance from the indel.  By default use a minimum BQ in flanking sequence.",
            "id": "#harmonic_indel_quality"
          },
          {
            "sbg:toolDefaultValue": "3",
            "label": "Haplotype length",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--haplotype-length"
            },
            "sbg:category": "Allele scope",
            "description": "Allow haplotype calls with contiguous embedded matches of up to this length.",
            "id": "#haplotype_length",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "label": "Haplotype basis alleles",
            "type": [
              "null",
              "File"
            ],
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "secondaryFiles": [
                ".tbi"
              ],
              "prefix": "--haplotype-basis-alleles"
            },
            "sbg:category": "Outputs",
            "description": "When specified, only variant alleles provided in this input VCF will be used for the construction of complex or haplotype alleles.",
            "id": "#haplotype_basis_alleles",
            "sbg:fileTypes": "VCF.GZ"
          },
          {
            "label": "GVCF chunk",
            "type": [
              "null",
              "int"
            ],
            "required": false,
            "id": "#gvcf_chunk",
            "sbg:category": "Outputs",
            "description": "When writing gVCF output emit a record for every NUM bases.",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--gvcf-chunk"
            },
            "sbg:stageInput": null
          },
          {
            "sbg:toolDefaultValue": "True",
            "label": "GVCF",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--gvcf"
            },
            "sbg:category": "Outputs",
            "description": "Write gVCF output, which indicates coverage in uncalled regions.",
            "id": "#gvcf",
            "type": [
              "null",
              "boolean"
            ],
            "sbg:stageInput": null
          },
          {
            "sbg:toolDefaultValue": "1000",
            "label": "Genotyping max iterations",
            "required": false,
            "sbg:altPrefix": "--genotyping-max-iterations",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-B"
            },
            "sbg:category": "Algorithmic features",
            "description": "Iterate no more than N times during genotyping step.",
            "id": "#genotyping_max_iterations",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "6",
            "label": "Genotyping max banddepth",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--genotyping-max-banddepth"
            },
            "sbg:category": "Algorithmic features",
            "description": "Integrate no deeper than the Nth best genotype by likelihood when genotyping.",
            "id": "#genotyping_max_banddepth",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "unbounded",
            "label": "Genotype variant threshold",
            "required": false,
            "sbg:altPrefix": "--genotype-variant-threshold",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-S"
            },
            "sbg:category": "Algorithmic features",
            "description": "Limit posterior integration to samples where the second-best genotype likelihood is no more than log(N) from the highest genotype likelihood for the sample.",
            "id": "#genotype_variant_threshold",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "label": "Genotype qualities",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "sbg:altPrefix": "--genotype-qualities",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-="
            },
            "sbg:category": "Algorithmic features",
            "description": "Calculate the marginal probability of genotypes and report as GQ in each sample field in the VCF output.",
            "id": "#genotype_qualities"
          },
          {
            "label": "Exclude unobserved genotypes",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "sbg:altPrefix": "--exclude-unobserved-genotypes",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-N"
            },
            "sbg:category": "Algorithmic features",
            "description": "Skip sample genotypings for which the sample has no supporting reads.",
            "id": "#exclude_unobserved_genotypes"
          },
          {
            "label": "Dont left align indels",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "sbg:altPrefix": "--dont-left-align-indels",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-O"
            },
            "sbg:category": "Indel realignment",
            "description": "Turn off left-alignment of indels, which is enabled by default.",
            "id": "#dont_left_align_indels"
          },
          {
            "label": "Contamination estimates",
            "type": [
              "null",
              "File"
            ],
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--contamination-estimates"
            },
            "sbg:category": "Genotype likelihoods",
            "description": "A file containing per-sample estimates of contamination, such as those generated by VerifyBamID.  The format should be: sample p(read=R|genotype=AR) p(read=A|genotype=AA) Sample '*' can be used to set default contamination estimates.",
            "id": "#contamination_estimates",
            "sbg:fileTypes": "NO_EXTENSION"
          },
          {
            "label": "CNV map",
            "type": [
              "null",
              "File"
            ],
            "required": false,
            "sbg:altPrefix": "--cnv-map",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-A"
            },
            "sbg:category": "Inputs",
            "sbg:fileTypes": "BED",
            "id": "#cnv_map",
            "description": "Read a copy number map from the BED file FILE, which has the format: reference sequence, start, end, sample name, copy number... for each region in each sample which does not have the default copy number as set by --ploidy."
          },
          {
            "label": "Binomial obs priors off",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "sbg:altPrefix": "--binomial-obs-priors-off",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-V"
            },
            "sbg:category": "Mappability priors",
            "description": "Disable incorporation of prior expectations about observations. Uses read placement probability, strand balance probability, and read position (5'-3') probability.",
            "id": "#binomial_obs_priors_off"
          },
          {
            "label": "Base quality cap",
            "type": [
              "null",
              "float"
            ],
            "required": false,
            "id": "#base_quality_cap",
            "sbg:category": "Genotype likelihoods",
            "description": "Limit estimated observation quality by capping base quality at Q.",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "--base-quality-cap"
            }
          },
          {
            "label": "Bam files",
            "type": [
              {
                "type": "array",
                "items": "File",
                "name": "bams"
              }
            ],
            "required": true,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "position": 100,
              "itemSeparator": null
            },
            "sbg:category": "Inputs",
            "description": "Bam files.",
            "id": "#bams",
            "sbg:fileTypes": "BAM"
          },
          {
            "label": "Bam index files",
            "type": [
              "null",
              {
                "type": "array",
                "items": "File",
                "name": "bam_index_files"
              }
            ],
            "required": false,
            "id": "#bam_index_files",
            "sbg:category": "Inputs",
            "description": "Index files for input bam files.",
            "sbg:stageInput": "copy",
            "sbg:fileTypes": "BAI"
          },
          {
            "label": "Allele balance priors off",
            "type": [
              "null",
              "boolean"
            ],
            "required": false,
            "sbg:altPrefix": "--allele-balance-priors-off",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "prefix": "-a"
            },
            "sbg:category": "Mappability priors",
            "description": "Disable use of aggregate probability of observation balance between alleles as a component of the priors.",
            "id": "#allele_balance_priors_off"
          },
          {
            "label": "VCF Name",
            "type": [
              "null",
              "string"
            ],
            "required": false,
            "id": "#VCF",
            "sbg:category": "Outputs",
            "description": "Name of the VCF file to be written (without the .vcf extension). If not provided, will be calculated from the BAM files."
          }
        ],
        "sbg:toolkit": "Freebayes",
        "appUrl": "/u/Durga/exome-sequencing/apps/#Durga/exome-sequencing/fbd/0",
        "sbg:createdOn": 1479408953,
        "sbg:toolkitVersion": "v1.0.2",
        "stdout": {
          "class": "Expression",
          "script": "{\n  if($job.inputs.gvcf) \n  {\n    if($job.inputs.bams instanceof Array && $job.inputs.bams.length>1)\n    {\n      filename=$job.inputs.bams[0].path\n      paths=filename.split('/')\n      names=filename.split('/')[paths.length-1].split('.')\n      names[names.length-1]='and_more.freebayes.g.vcf'\n      return names.join(\".\")\n    }\n    filename=''\n  \tif ($job.inputs.bams instanceof Array)\n      filename = $job.inputs.bams[0].path\n    else\n      filename = $job.inputs.bams.path\n    paths=filename.split('/')\n    names=filename.split('/')[paths.length-1].split('.')\n    names[names.length-1]='freebayes.g.vcf'\n    return names.join(\".\")\n  }\n  return \"\"\n}",
          "engine": "#cwl-js-engine"
        },
        "sbg:project": "Durga/exome-sequencing",
        "sbg:revision": 0,
        "sbg:license": "MIT licence",
        "sbg:job": {
          "allocatedResources": {
            "cpu": 1,
            "mem": 2000
          },
          "inputs": {
            "region": {
              "size": 0,
              "class": "File",
              "secondaryFiles": [],
              "path": "/path/to/region.ext"
            },
            "min_coverage": 0,
            "VCF": "",
            "report_genotype_likelihood_max": true,
            "haplotype_basis_alleles": {
              "size": 0,
              "class": "File",
              "secondaryFiles": [
                {
                  "path": ".tbi"
                }
              ],
              "path": "/path/to/haplotype_basis_alleles.ext"
            },
            "pooled_continuous": true,
            "no_mnps": true,
            "no_snps": true,
            "read_mismatch_limit": 0,
            "legacy_gls": true,
            "pooled_discrete": true,
            "read_max_mismatch_fraction": 0,
            "reference_quality": [
              10,
              10
            ],
            "no_indels": true,
            "bam_index_files": [
              {
                "size": 0,
                "class": "File",
                "secondaryFiles": [],
                "path": "/path/to/bais.ext"
              }
            ],
            "gvcf_chunk": 10,
            "min_alternate_qsum": 0,
            "use_reference_allele": true,
            "min_mapping_quality": 0,
            "gvcf": false,
            "genotyping_max_banddepth": 0,
            "read_snp_limit": 0,
            "binomial_obs_priors_off": true,
            "only_use_input_alleles": true,
            "min_alternate_total": 0,
            "min_supporting_mapping_qsum": 0,
            "no_population_priors": true,
            "allele_balance_priors_off": true,
            "bams": [
              {
                "size": 0,
                "class": "File",
                "secondaryFiles": [],
                "path": "/path/to/bams.ext"
              },
              {
                "size": 0,
                "class": "File",
                "secondaryFiles": [],
                "path": "/path/to/bams.ext"
              }
            ],
            "theta": 0,
            "exclude_unobserved_genotypes": true,
            "min_base_quality": 0,
            "genotyping_max_iterations": 0,
            "min_repeat_entropy": 0,
            "harmonic_indel_quality": true,
            "haplotype_length": 0,
            "cnv_map": {
              "size": 0,
              "class": "File",
              "secondaryFiles": [],
              "path": "/path/to/cnv_map.ext"
            },
            "no_partial_observations": true,
            "standard_filters": true,
            "posterior_integration_limits": [
              5,
              4
            ],
            "use_mapping_quality": true,
            "use_best_n_alleles": 0,
            "read_indel_limit": 0,
            "read_dependence_factor": 0,
            "mismatch_base_quality_threshold": 0,
            "no_complex": true,
            "ploidy": 0,
            "dont_left_align_indels": true,
            "min_alternate_count": 0,
            "hwe_priors_off": true,
            "min_alternate_fraction": 0,
            "base_quality_cap": 0,
            "min_supporting_allele_qsum": 0,
            "region_chr_stpos_endpos": "region_chr_stpos_endpos",
            "prob_contamination": 0,
            "genotype_variant_threshold": 0,
            "report_monomorphic": true,
            "max_coverage": 0,
            "populations": {
              "size": 0,
              "class": "File",
              "secondaryFiles": [],
              "path": "/path/to/populations.ext"
            },
            "samples": {
              "size": 0,
              "class": "File",
              "secondaryFiles": [],
              "path": "/path/to/samples.ext"
            },
            "genotype_qualities": true,
            "reference": {
              "size": 0,
              "class": "File",
              "secondaryFiles": [],
              "path": "/path/to/reference.ext"
            },
            "use_duplicate_reads": true,
            "observation_bias": {
              "size": 0,
              "class": "File",
              "secondaryFiles": [],
              "path": "/path/to/observation_bias.ext"
            },
            "pvar": 0,
            "max_complex_gap": 0,
            "contamination_estimates": {
              "size": 0,
              "class": "File",
              "secondaryFiles": [],
              "path": "/path/to/contamination_estimates.ext"
            },
            "variant_input": {
              "size": 0,
              "class": "File",
              "secondaryFiles": [
                {
                  "path": ".tbi"
                }
              ],
              "path": "/path/to/variant_input.ext"
            },
            "report_all_haplotype_alleles": true,
            "min_repeat_size": 0
          }
        },
        "class": "CommandLineTool",
        "x": 1555.7142857142862,
        "sbg:cmdPreview": "/opt/freebayes/bin/freebayes -f /path/to/reference.ext  -v bams.and_more.freebayes.vcf  /path/to/bams.ext  /path/to/bams.ext",
        "sbg:validationErrors": [],
        "sbg:toolAuthor": "Erik Garrison",
        "sbg:revisionsInfo": [
          {
            "sbg:modifiedBy": "Durga",
            "sbg:revisionNotes": "Copy of admin/sbg-public-data/fbd/79",
            "sbg:modifiedOn": 1479408953,
            "sbg:revision": 0
          }
        ],
        "baseCommand": [
          "/opt/freebayes/bin/freebayes"
        ],
        "requirements": [
          {
            "requirements": [
              {
                "dockerPull": "rabix/js-engine",
                "class": "DockerRequirement"
              }
            ],
            "class": "ExpressionEngineRequirement",
            "id": "#cwl-js-engine"
          }
        ],
        "sbg:contributors": [
          "Durga"
        ],
        "sbg:copyOf": "admin/sbg-public-data/fbd/79",
        "sbg:links": [
          {
            "label": "Homepage",
            "id": "https://github.com/ekg/freebayes"
          },
          {
            "label": "Source code",
            "id": "https://github.com/ekg/freebayes"
          },
          {
            "label": "Download",
            "id": "https://github.com/ekg/freebayes"
          },
          {
            "label": "Publication",
            "id": "http://arxiv.org/pdf/1207.3907v2.pdf"
          },
          {
            "label": "Documentation",
            "id": "https://github.com/ekg/freebayes"
          }
        ],
        "sbg:id": "Durga/exome-sequencing/fbd/0",
        "id": "Durga/exome-sequencing/fbd/0",
        "arguments": [
          {
            "separate": true,
            "valueFrom": {
              "class": "Expression",
              "script": "{\n  if ($job.inputs.VCF){\n    return \"-v \" + $job.inputs.VCF + \".freebayes.vcf\"\n  }\n  if(!$job.inputs.gvcf)\n  {\n    \n  \tif ($job.inputs.bams instanceof Array && $job.inputs.bams.length>1) {\n  \t\tfilename = $job.inputs.bams[0].path\n  \t\tpaths = filename.split('/')\n  \t\tnames = filename.split('/')[paths.length-1].split('.')\n  \t\tnames[names.length-1] = 'and_more.freebayes.vcf'\n  \t\treturn \"-v \" + names.join(\".\")\n  \t}\n\tfilename=''\n  \tif ($job.inputs.bams instanceof Array)\n      filename = $job.inputs.bams[0].path\n    else\n      filename = $job.inputs.bams.path\n  \tpaths = filename.split('/')\n  \tnames = filename.split('/')[paths.length-1].split('.')\n  \tnames[names.length-1] = 'freebayes.vcf'\n  \treturn \"-v \" + names.join(\".\")\n  }\n}\n  ",
              "engine": "#cwl-js-engine"
            },
            "prefix": ""
          }
        ],
        "sbg:latestRevision": 0,
        "hints": [
          {
            "class": "sbg:CPURequirement",
            "value": 1
          },
          {
            "class": "sbg:MemRequirement",
            "value": 2000
          },
          {
            "dockerPull": "images.sbgenomics.com/nevenam/freebayes:1.0.2",
            "class": "DockerRequirement",
            "dockerImageId": ""
          }
        ],
        "sbg:image_url": null,
        "description": "FreeBayes is a Bayesian genetic variant detector designed to find small polymorphisms, specifically SNPs (single-nucleotide polymorphisms), indels (insertions and deletions), MNPs (multi-nucleotide polymorphisms), and complex events (composite insertion and substitution events) smaller than the length of a short-read sequencing alignment.\n\nFreeBayes incorporates a number of features in order to reduce the complexity of variant detection for researchers and developers:\n\n1. Indel realignment is accomplished internally using a read-independent method, and issues resulting from discordant alignments are dramatically reduced through the direct detection of haplotypes.\n2. The need for base quality recalibration is avoided through the direct detection of haplotypes. Sequencing platform errors tend to cluster (e.g. at the ends of reads), and generate unique, non-repeating haplotypes at a given locus.\n3. Variant quality recalibration is avoided by incorporating a number of metrics, such as read placement bias and allele balance, directly into the Bayesian model.\n\n###Common Issues\nFASTA INDEX FILE is not required. If it is not provided (as secondary file), it is generated. When it is provided, the tool runs faster.\nBAM INDEX FILES are not required, but when not provided (as separate input), random access is disabled.\nVARIANT INPUT INDEX FILE is required (as secondary file). It should be generated using Tabix BGZIP and Tabix Index file.\nREGION parameter should match data present in variant input file, both chromosome and positions.",
        "sbg:sbgMaintained": false,
        "sbg:createdBy": "Durga",
        "label": "Freebayes",
        "successCodes": [],
        "sbg:revisionNotes": "Copy of admin/sbg-public-data/fbd/79",
        "sbg:categories": [
          "Variant-Calling"
        ],
        "y": 101.13281250000004,
        "sbg:modifiedOn": 1479408953
      },
      "inputs": [
        {
          "id": "#Freebayes.variant_input"
        },
        {
          "id": "#Freebayes.use_reference_allele"
        },
        {
          "id": "#Freebayes.use_mapping_quality"
        },
        {
          "id": "#Freebayes.use_duplicate_reads"
        },
        {
          "id": "#Freebayes.use_best_n_alleles"
        },
        {
          "id": "#Freebayes.theta"
        },
        {
          "id": "#Freebayes.standard_filters"
        },
        {
          "id": "#Freebayes.samples"
        },
        {
          "id": "#Freebayes.report_monomorphic"
        },
        {
          "id": "#Freebayes.report_genotype_likelihood_max"
        },
        {
          "id": "#Freebayes.report_all_haplotype_alleles"
        },
        {
          "id": "#Freebayes.region_chr_stpos_endpos"
        },
        {
          "id": "#Freebayes.region"
        },
        {
          "id": "#Freebayes.reference_quality"
        },
        {
          "id": "#Freebayes.reference",
          "source": [
            "#SBG_FASTA_Indices.fasta_reference"
          ]
        },
        {
          "id": "#Freebayes.read_snp_limit"
        },
        {
          "id": "#Freebayes.read_mismatch_limit"
        },
        {
          "id": "#Freebayes.read_max_mismatch_fraction"
        },
        {
          "id": "#Freebayes.read_indel_limit"
        },
        {
          "id": "#Freebayes.read_dependence_factor"
        },
        {
          "id": "#Freebayes.pvar"
        },
        {
          "id": "#Freebayes.prob_contamination"
        },
        {
          "id": "#Freebayes.posterior_integration_limits"
        },
        {
          "id": "#Freebayes.populations"
        },
        {
          "id": "#Freebayes.pooled_discrete"
        },
        {
          "id": "#Freebayes.pooled_continuous"
        },
        {
          "id": "#Freebayes.ploidy"
        },
        {
          "id": "#Freebayes.only_use_input_alleles"
        },
        {
          "id": "#Freebayes.observation_bias"
        },
        {
          "id": "#Freebayes.no_snps"
        },
        {
          "id": "#Freebayes.no_population_priors"
        },
        {
          "id": "#Freebayes.no_partial_observations"
        },
        {
          "id": "#Freebayes.no_mnps"
        },
        {
          "id": "#Freebayes.no_indels"
        },
        {
          "id": "#Freebayes.no_complex"
        },
        {
          "id": "#Freebayes.mismatch_base_quality_threshold"
        },
        {
          "id": "#Freebayes.min_supporting_mapping_qsum"
        },
        {
          "id": "#Freebayes.min_supporting_allele_qsum"
        },
        {
          "id": "#Freebayes.min_repeat_size"
        },
        {
          "id": "#Freebayes.min_repeat_entropy"
        },
        {
          "id": "#Freebayes.min_mapping_quality"
        },
        {
          "id": "#Freebayes.min_coverage"
        },
        {
          "id": "#Freebayes.min_base_quality"
        },
        {
          "id": "#Freebayes.min_alternate_total"
        },
        {
          "id": "#Freebayes.min_alternate_qsum"
        },
        {
          "id": "#Freebayes.min_alternate_fraction"
        },
        {
          "id": "#Freebayes.min_alternate_count"
        },
        {
          "id": "#Freebayes.max_coverage"
        },
        {
          "id": "#Freebayes.max_complex_gap"
        },
        {
          "id": "#Freebayes.legacy_gls"
        },
        {
          "id": "#Freebayes.hwe_priors_off"
        },
        {
          "id": "#Freebayes.harmonic_indel_quality"
        },
        {
          "id": "#Freebayes.haplotype_length"
        },
        {
          "id": "#Freebayes.haplotype_basis_alleles"
        },
        {
          "id": "#Freebayes.gvcf_chunk"
        },
        {
          "id": "#Freebayes.gvcf"
        },
        {
          "id": "#Freebayes.genotyping_max_iterations"
        },
        {
          "id": "#Freebayes.genotyping_max_banddepth"
        },
        {
          "id": "#Freebayes.genotype_variant_threshold"
        },
        {
          "id": "#Freebayes.genotype_qualities"
        },
        {
          "id": "#Freebayes.exclude_unobserved_genotypes"
        },
        {
          "id": "#Freebayes.dont_left_align_indels"
        },
        {
          "id": "#Freebayes.contamination_estimates"
        },
        {
          "id": "#Freebayes.cnv_map"
        },
        {
          "id": "#Freebayes.binomial_obs_priors_off"
        },
        {
          "id": "#Freebayes.base_quality_cap"
        },
        {
          "id": "#Freebayes.bams",
          "source": [
            "#GATK_IndelRealigner.realigned_bam_file"
          ]
        },
        {
          "id": "#Freebayes.bam_index_files"
        },
        {
          "id": "#Freebayes.allele_balance_priors_off"
        },
        {
          "id": "#Freebayes.VCF"
        }
      ],
      "outputs": [
        {
          "id": "#Freebayes.variants"
        }
      ],
      "sbg:x": 1555.7142857142862,
      "sbg:y": 101.13281250000004
    },
    {
      "id": "#Picard_BuildBamIndex",
      "run": {
        "stdin": "",
        "sbg:modifiedBy": "Durga",
        "outputs": [
          {
            "label": "Indexed BAM",
            "outputBinding": {
              "sbg:metadata": {
                "__inherit__": "input_file"
              },
              "glob": {
                "class": "Expression",
                "script": "{ if (!$job.inputs.output_index){\n  return '*.bam'\n}\n}",
                "engine": "#cwl-js-engine"
              },
              "sbg:inheritMetadataFrom": "#input_bam",
              "secondaryFiles": [
                "^.bai",
                ".bai"
              ]
            },
            "id": "#indexed_bam",
            "type": [
              "null",
              "File"
            ],
            "sbg:fileTypes": "BAM, BAI",
            "description": "The BAM index file. Defaults to x.bai if INPUT is x.bam, otherwise INPUT.bai. If INPUT is a URL and OUTPUT is unspecified, defaults to a file in the current directory."
          },
          {
            "label": "Indexed BAM (.BAI)",
            "outputBinding": {
              "sbg:inheritMetadataFrom": "#input_bam",
              "glob": {
                "class": "Expression",
                "script": "{ if ($job.inputs.output_index === true){\n  return '*.bai'\n}\n\n}",
                "engine": "#cwl-js-engine"
              }
            },
            "id": "#index",
            "type": [
              "null",
              "File"
            ],
            "sbg:fileTypes": "BAI",
            "description": "Indexed BAM."
          }
        ],
        "temporaryFailCodes": [],
        "inputs": [
          {
            "sbg:toolDefaultValue": "INFO",
            "label": "Verbosity",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": false,
              "valueFrom": {
                "class": "Expression",
                "script": "{\n  if (!(typeof $job.inputs.input_bai !== \"undefined\"))\n  {\n    if ($job.inputs.verbosity)\n    \treturn $job.inputs.verbosity\n  }\n}\n\n",
                "engine": "#cwl-js-engine"
              },
              "position": 7,
              "prefix": "VERBOSITY="
            },
            "sbg:category": "Options",
            "description": "Control verbosity of logging. Default value: INFO. This option can be set to 'null' to clear the default value. Possible values: {ERROR, WARNING, INFO, DEBUG}.",
            "id": "#verbosity",
            "type": [
              "null",
              {
                "type": "enum",
                "symbols": [
                  "ERROR",
                  "WARNING",
                  "INFO",
                  "DEBUG"
                ],
                "name": "verbosity"
              }
            ]
          },
          {
            "sbg:toolDefaultValue": "SILENT",
            "label": "Validation stringency",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": false,
              "valueFrom": {
                "class": "Expression",
                "script": "{\n  if (!(typeof $job.inputs.input_bai !== \"undefined\"))\n{\n  if ($job.inputs.validation_stringency)\n  {\n    return $job.inputs.validation_stringency\n  }\n  else\n  {\n    return \"SILENT\"\n  }\n}\n}",
                "engine": "#cwl-js-engine"
              },
              "prefix": "VALIDATION_STRINGENCY="
            },
            "sbg:category": "Options",
            "description": "Validation stringency for all SAM files read by this program. Setting stringency to SILENT can improve performance when processing a BAM file in which variable-length data (read, qualities, tags) do not otherwise need to be decoded. Default value: STRICT. This option can be set to 'null' to clear the default value. Possible values: {STRICT, LENIENT, SILENT}.",
            "id": "#validation_stringency",
            "type": [
              "null",
              {
                "type": "enum",
                "symbols": [
                  "STRICT",
                  "LENIENT",
                  "SILENT"
                ],
                "name": "validation_stringency"
              }
            ]
          },
          {
            "sbg:toolDefaultValue": "False",
            "label": "Quiet",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": false,
              "valueFrom": {
                "class": "Expression",
                "script": "{\n  if (!(typeof $job.inputs.input_bai !== \"undefined\"))\n  {\n    if ($job.inputs.quiet)\n    \treturn $job.inputs.quiet\n  }\n}\n\n",
                "engine": "#cwl-js-engine"
              },
              "prefix": "QUIET="
            },
            "sbg:category": "Options",
            "description": "This parameter indicates whether to suppress job-summary info on System.err. Default value: False. This option can be set to 'null' to clear the default value. Possible values: {True, False}",
            "id": "#quiet",
            "type": [
              "null",
              {
                "type": "enum",
                "symbols": [
                  "True",
                  "False"
                ],
                "name": "quiet"
              }
            ]
          },
          {
            "sbg:toolDefaultValue": "False",
            "label": "Output only index file",
            "required": false,
            "id": "#output_index",
            "sbg:category": "Options",
            "description": "Don’t output BAM file. This parameter is used if you only want to output only index file.",
            "type": [
              "null",
              "boolean"
            ]
          },
          {
            "sbg:toolDefaultValue": "2048",
            "label": "Memory per job",
            "required": false,
            "id": "#memory_per_job",
            "sbg:category": "Execution options",
            "description": "Amount of RAM memory to be used per job. Defaults to 2048 MB for single threaded jobs.",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "sbg:toolDefaultValue": "500000",
            "label": "Max records in RAM",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": true,
              "valueFrom": {
                "class": "Expression",
                "script": "{\n  if (!(typeof $job.inputs.input_bai !== \"undefined\"))\n  {\n    if ($job.inputs.max_records_in_ram)\n    \treturn $job.inputs.max_records_in_ram\n  }\n}\n\n",
                "engine": "#cwl-js-engine"
              },
              "prefix": "MAX_RECORDS_IN_RAM="
            },
            "sbg:category": "Options",
            "description": "When writing SAM files that need to be sorted, this will specify the number of records stored in RAM before spilling to disk. Increasing this number reduces the number of file handles needed to sort a SAM file, and increases the amount of RAM needed. Default value: 500000. This option can be set to 'null' to clear the default value.",
            "id": "#max_records_in_ram",
            "type": [
              "null",
              "int"
            ]
          },
          {
            "label": "Input BAM",
            "type": [
              "File"
            ],
            "required": true,
            "sbg:altPrefix": "I",
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": false,
              "valueFrom": {
                "class": "Expression",
                "script": "{\n  if (!(typeof $job.inputs.input_bai !== \"undefined\"))\n  {\n    if ($job.inputs.input_bam)\n    \treturn $job.inputs.input_bam.path.split('/').slice(-1)[0]\n  }\n}\n\n\n",
                "engine": "#cwl-js-engine"
              },
              "position": 1,
              "prefix": "INPUT="
            },
            "sbg:category": "File inputs",
            "sbg:fileTypes": "BAM",
            "id": "#input_bam",
            "description": "A BAM file or URL to process. Must be sorted in coordinate order.  Required.",
            "sbg:stageInput": "link"
          },
          {
            "label": "Input BAI",
            "type": [
              "null",
              "File"
            ],
            "required": false,
            "id": "#input_bai",
            "sbg:category": "File inputs",
            "description": "Input BAI file.",
            "sbg:stageInput": "link",
            "sbg:fileTypes": "BAI"
          },
          {
            "sbg:toolDefaultValue": "5",
            "label": "Compression level",
            "required": false,
            "inputBinding": {
              "sbg:cmdInclude": true,
              "separate": false,
              "valueFrom": {
                "class": "Expression",
                "script": "{\n  if (!(typeof $job.inputs.input_bai !== \"undefined\"))\n  {\n    if ($job.inputs.compression_level)\n    \treturn $job.inputs.compression_level\n  }\n}\n\n",
                "engine": "#cwl-js-engine"
              },
              "prefix": "COMPRESSION_LEVEL="
            },
            "sbg:category": "Options",
            "description": "Compression level for all compressed files created (e.g. BAM and GELI). Default value: 5. This option can be set to 'null' to clear the default value.",
            "id": "#compression_level",
            "type": [
              "null",
              "int"
            ]
          }
        ],
        "sbg:toolkit": "Picard",
        "appUrl": "/u/Durga/durgafiles/apps/#Durga/durgafiles/picard-buildbamindex-1-140/0",
        "sbg:createdOn": 1478014735,
        "sbg:toolkitVersion": "1.140",
        "stdout": "",
        "sbg:project": "Durga/durgafiles",
        "sbg:revision": 0,
        "sbg:license": "MIT License, Apache 2.0 Licence",
        "sbg:job": {
          "allocatedResources": {
            "cpu": 1,
            "mem": 2048
          },
          "inputs": {
            "compression_level": null,
            "output_index": false,
            "max_records_in_ram": null,
            "memory_per_job": 0,
            "verbosity": "DEBUG",
            "validation_stringency": "SILENT",
            "input_bam": {
              "path": "root/dir/example.bam"
            }
          }
        },
        "class": "CommandLineTool",
        "x": 1051.5240709603368,
        "sbg:cmdPreview": "java -Xmx2048M -jar /opt/picard-tools-1.140/picard.jar BuildBamIndex OUTPUT=example.bam.bai INPUT=example.bam",
        "sbg:validationErrors": [],
        "sbg:toolAuthor": "Broad Institute",
        "sbg:revisionsInfo": [
          {
            "sbg:modifiedBy": "Durga",
            "sbg:revisionNotes": "Copy of admin/sbg-public-data/picard-buildbamindex-1-140/4",
            "sbg:modifiedOn": 1478014735,
            "sbg:revision": 0
          }
        ],
        "baseCommand": [
          {
            "class": "Expression",
            "script": "{\n  if (typeof $job.inputs.input_bai !== \"undefined\"){\n \treturn\"echo Skipping index step because BAI file is provided on the input.\"\n  }\n  else{\n    if($job.inputs.memory_per_job){\n      return 'java -Xmx'.concat($job.inputs.memory_per_job, 'M -jar /opt/picard-tools-1.140/picard.jar BuildBamIndex')\n  }   \n  \treturn 'java -Xmx2048M -jar /opt/picard-tools-1.140/picard.jar BuildBamIndex'\n  }\n}\n\n\n",
            "engine": "#cwl-js-engine"
          }
        ],
        "requirements": [
          {
            "requirements": [
              {
                "dockerPull": "rabix/js-engine",
                "class": "DockerRequirement"
              }
            ],
            "engineCommand": "cwl-engine.js",
            "class": "ExpressionEngineRequirement",
            "id": "#cwl-js-engine"
          }
        ],
        "sbg:contributors": [
          "Durga"
        ],
        "sbg:copyOf": "admin/sbg-public-data/picard-buildbamindex-1-140/4",
        "sbg:links": [
          {
            "label": "Homepage",
            "id": "http://broadinstitute.github.io/picard/index.html"
          },
          {
            "label": "Source Code",
            "id": "https://github.com/broadinstitute/picard/releases/tag/1.140"
          },
          {
            "label": "Wiki",
            "id": "http://broadinstitute.github.io/picard/"
          },
          {
            "label": "Download",
            "id": "https://github.com/broadinstitute/picard/zipball/master"
          },
          {
            "label": "Publication",
            "id": "http://broadinstitute.github.io/picard/"
          }
        ],
        "sbg:id": "Durga/durgafiles/picard-buildbamindex-1-140/0",
        "id": "Durga/durgafiles/picard-buildbamindex-1-140/0",
        "arguments": [
          {
            "separate": false,
            "valueFrom": {
              "class": "Expression",
              "script": "{\n  if ((!(typeof $job.inputs.input_bai !== \"undefined\")))\n  {\n    {\n  filename = $job.inputs.input_bam.path\n  return 'OUTPUT='+filename.split('.').slice(0, -1).concat(\"bam.bai\").join(\".\").replace(/^.*[\\\\\\/]/, '')\n}\n  }\n}",
              "engine": "#cwl-js-engine"
            },
            "prefix": ""
          }
        ],
        "sbg:latestRevision": 0,
        "hints": [
          {
            "dockerPull": "images.sbgenomics.com/mladenlsbg/picard:1.140",
            "class": "DockerRequirement",
            "dockerImageId": "eab0e70b6629"
          },
          {
            "class": "sbg:CPURequirement",
            "value": 1
          },
          {
            "class": "sbg:MemRequirement",
            "value": {
              "class": "Expression",
              "script": "{\n  if($job.inputs.memory_per_job){\n  \treturn $job.inputs.memory_per_job\n  }\n  \treturn 2048\n}",
              "engine": "#cwl-js-engine"
            }
          }
        ],
        "sbg:image_url": null,
        "description": "Picard BuildBamIndex generates a BAM index (.bai) file.",
        "sbg:sbgMaintained": false,
        "sbg:createdBy": "Durga",
        "label": "Picard BuildBamIndex",
        "successCodes": [],
        "sbg:revisionNotes": "Copy of admin/sbg-public-data/picard-buildbamindex-1-140/4",
        "sbg:categories": [
          "SAM/BAM-Processing"
        ],
        "y": 202.96214764200815,
        "sbg:modifiedOn": 1478014735
      },
      "inputs": [
        {
          "id": "#Picard_BuildBamIndex.verbosity"
        },
        {
          "id": "#Picard_BuildBamIndex.validation_stringency"
        },
        {
          "id": "#Picard_BuildBamIndex.quiet"
        },
        {
          "id": "#Picard_BuildBamIndex.output_index"
        },
        {
          "id": "#Picard_BuildBamIndex.memory_per_job"
        },
        {
          "id": "#Picard_BuildBamIndex.max_records_in_ram"
        },
        {
          "id": "#Picard_BuildBamIndex.input_bam",
          "source": [
            "#Sambamba_Merge.merged_bam"
          ]
        },
        {
          "id": "#Picard_BuildBamIndex.input_bai"
        },
        {
          "id": "#Picard_BuildBamIndex.compression_level"
        }
      ],
      "outputs": [
        {
          "id": "#Picard_BuildBamIndex.indexed_bam"
        },
        {
          "id": "#Picard_BuildBamIndex.index"
        }
      ],
      "sbg:x": 1051.5240709603368,
      "sbg:y": 202.96214764200815
    }
  ],
  "requirements": [],
  "inputs": [
    {
      "label": "reference",
      "id": "#reference",
      "type": [
        "File"
      ],
      "sbg:fileTypes": "FASTA,FA,FA.GZ,FASTA.GZ,TAR",
      "sbg:x": -52.14285203388762,
      "sbg:y": 83.13114356914804
    },
    {
      "label": "fastq_list",
      "id": "#fastq_list",
      "type": [
        {
          "type": "array",
          "items": "File",
          "name": "fastq_list"
        }
      ],
      "sbg:fileTypes": "FASTQ, FQ, FASTQ.GZ, FQ.GZ",
      "sbg:x": -170.0000032502789,
      "sbg:y": 502.85710527458724
    },
    {
      "label": "target_intervals",
      "id": "#target_intervals",
      "type": [
        "File"
      ],
      "sbg:fileTypes": "TXT,INTERVALS",
      "sbg:x": -67.23809353834898,
      "sbg:includeInPorts": true,
      "sbg:y": 234.36536170567715
    }
  ],
  "outputs": [
    {
      "label": "#aligned_reads",
      "required": false,
      "id": "#aligned_reads",
      "type": [
        "null",
        "File"
      ],
      "sbg:fileTypes": "SAM, BAM",
      "sbg:x": 1755.0477870759546,
      "sbg:includeInPorts": true,
      "sbg:y": 415.1272721961143,
      "source": [
        "#BWA_MEM_Bundle.aligned_reads"
      ]
    },
    {
      "label": "report_zip",
      "required": false,
      "id": "#report_zip",
      "type": [
        "null",
        "File"
      ],
      "sbg:fileTypes": "ZIP",
      "sbg:x": 1749.9999863079624,
      "sbg:includeInPorts": true,
      "sbg:y": 575.6974864304816,
      "source": [
        "#FastQC.report_zip"
      ]
    },
    {
      "label": "report_html",
      "required": false,
      "id": "#report_html",
      "type": [
        "null",
        "File"
      ],
      "sbg:fileTypes": "HTML",
      "sbg:x": 1747.1428434508196,
      "sbg:includeInPorts": true,
      "sbg:y": 694.2689118002893,
      "source": [
        "#FastQC.report_html"
      ]
    },
    {
      "label": "variants",
      "required": false,
      "id": "#variants",
      "type": [
        "null",
        "File"
      ],
      "sbg:fileTypes": "VCF, G.VCF",
      "sbg:x": 1735.7142287857719,
      "sbg:includeInPorts": true,
      "sbg:y": 118.55468061087392,
      "source": [
        "#Freebayes.variants"
      ]
    },
    {
      "label": "merged_bam",
      "required": false,
      "id": "#merged_bam",
      "type": [
        "null",
        "File"
      ],
      "sbg:fileTypes": "BAM",
      "sbg:x": 1894.2856766253083,
      "sbg:includeInPorts": true,
      "sbg:y": 308.55465303148145,
      "source": [
        "#Sambamba_Merge.merged_bam"
      ]
    }
  ],
  "sbg:modifiedBy": "Durga",
  "sbg:project": "Durga/exome-sequencing",
  "sbg:createdOn": 1481139873,
  "sbg:revision": 8,
  "sbg:latestRevision": 8,
  "sbg:validationErrors": [],
  "sbg:canvas_x": 262,
  "sbg:revisionsInfo": [
    {
      "sbg:modifiedBy": "Durga",
      "sbg:revisionNotes": "Copy of Durga/exome-sequencing/exomeseqanalysis02-withfreebayes/4",
      "sbg:revision": 0,
      "sbg:modifiedOn": 1481139873
    },
    {
      "sbg:modifiedBy": "Durga",
      "sbg:revisionNotes": "Changed Name",
      "sbg:revision": 1,
      "sbg:modifiedOn": 1481139918
    },
    {
      "sbg:modifiedBy": "Durga",
      "sbg:revisionNotes": "Output format - SortedBAM (default threads)\nDuplication - Mark duplication\n\ndeleted sambamba sort and mark duplicates",
      "sbg:revision": 2,
      "sbg:modifiedOn": 1481141068
    },
    {
      "sbg:modifiedBy": "Durga",
      "sbg:revisionNotes": null,
      "sbg:revision": 3,
      "sbg:modifiedOn": 1481141157
    },
    {
      "sbg:modifiedBy": "Durga",
      "sbg:revisionNotes": "added\n- append_comment",
      "sbg:revision": 4,
      "sbg:modifiedOn": 1481157645
    },
    {
      "sbg:modifiedBy": "Durga",
      "sbg:revisionNotes": "unlocked Read_group_header parameter",
      "sbg:revision": 5,
      "sbg:modifiedOn": 1483475270
    },
    {
      "sbg:modifiedBy": "Durga",
      "sbg:revisionNotes": "removed batch mode",
      "sbg:revision": 6,
      "sbg:modifiedOn": 1483721564
    },
    {
      "sbg:modifiedBy": "Durga",
      "sbg:revisionNotes": "added interval_list file type to input",
      "sbg:revision": 7,
      "sbg:modifiedOn": 1483980618
    },
    {
      "sbg:modifiedBy": "Durga",
      "sbg:revisionNotes": null,
      "sbg:revision": 8,
      "sbg:modifiedOn": 1483980709
    }
  ],
  "sbg:contributors": [
    "Durga"
  ],
  "sbg:id": "Durga/exome-sequencing/exomeseqanalysis02-removesortaddparameters/8",
  "sbg:canvas_y": 126,
  "sbg:createdBy": "Durga",
  "sbg:image_url": "https://cgc-brood.sbgenomics.com/static/Durga/exome-sequencing/exomeseqanalysis02-removesortaddparameters/8.png",
  "sbg:sbgMaintained": false,
  "sbg:canvas_zoom": 0.6999999999999997,
  "sbg:modifiedOn": 1483980709,
  "id": "Durga/exome-sequencing/exomeseqanalysis02-removesortaddparameters/8",
  "label": "ExomeSeqAnalysis02-RemoveSortAddParameters",
  "description": "",
  "hints": []
}
