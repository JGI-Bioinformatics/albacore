# albacore
Dockerfile for the Albacore basecaller from Oxford Nanopore

## usage
cd into the directory containing the directory of reads

```
docker run -v $(pwd):/root robegan21/albacore read_fast5_basecaller.py 
--input relative/path/to/reads \
--flowcell FLO-MIN107 --kit SQK-LSK108 \
--save_path output \
--threads $(nproc)
```


### possible configs are described by read_fast5_basecaller.py:
```
docker run -v $(pwd):/root robegan21/albacore read_fast5_basecaller.py -l

Parsing config files in /opt/albacore.
Available flowcell + kit combinations are:
flowcell    kit         barcoding  config file
FLO-MIN106  SQK-LSK108             r94_450bps_linear.cfg
FLO-MIN106  SQK-LSK208             r94_250bps_2d.cfg
FLO-MIN106  SQK-LWB001  included   r94_450bps_linear.cfg
FLO-MIN106  SQK-LWP001             r94_450bps_linear.cfg
FLO-MIN106  SQK-RAB201  included   r94_450bps_linear.cfg
FLO-MIN106  SQK-RAD002             r94_450bps_linear.cfg
FLO-MIN106  SQK-RAS201             r94_450bps_linear.cfg
FLO-MIN106  SQK-RBK001  included   r94_450bps_linear.cfg
FLO-MIN106  SQK-RLB001  included   r94_450bps_linear.cfg
FLO-MIN106  SQK-RLI001             r94_450bps_linear.cfg
FLO-MIN106  SQK-RNA001             r94_70bps_rna_linear.cfg
FLO-MIN106  VSK-VBK001             r94_450bps_linear.cfg
FLO-MIN107  SQK-LSK108             r95_450bps_linear.cfg
FLO-MIN107  SQK-LSK308             r95_450bps_linear.cfg
FLO-MIN107  SQK-LWB001  included   r95_450bps_linear.cfg
FLO-MIN107  SQK-LWP001             r95_450bps_linear.cfg
FLO-MIN107  SQK-RAB201  included   r95_450bps_linear.cfg
FLO-MIN107  SQK-RAD002             r95_450bps_linear.cfg
FLO-MIN107  SQK-RAS201             r95_450bps_linear.cfg
FLO-MIN107  SQK-RBK001  included   r95_450bps_linear.cfg
FLO-MIN107  SQK-RLB001  included   r95_450bps_linear.cfg
FLO-MIN107  SQK-RLI001             r95_450bps_linear.cfg
FLO-MIN107  VSK-VBK001             r95_450bps_linear.cfg
```

### Usage

```
usage: read_fast5_basecaller.py [-h] [-l] [-v] -i INPUT -t WORKER_THREADS -s
                                SAVE_PATH [-f FLOWCELL] [-k KIT] [--barcoding]
                                [-c CONFIG] [-d DATA_PATH] [-b] [-r]
                                [-n FILES_PER_BATCH_FOLDER] [-o OUTPUT_FORMAT]
                                [-q READS_PER_FASTQ_BATCH]

ONT Albacore Sequencing Pipeline Software

optional arguments:
  -h, --help            show this help message and exit
  -l, --list_workflows  List standard flowcell / kit combinations.
  -v, --version         Print the software version.
  -i INPUT, --input INPUT
                        Folder containing read fast5 files (if not present,
                        will expect file names on stdin).
  -t WORKER_THREADS, --worker_threads WORKER_THREADS
                        Number of worker threads to use.
  -s SAVE_PATH, --save_path SAVE_PATH
                        Path to save output.
  -f FLOWCELL, --flowcell FLOWCELL
                        Flowcell used during the sequencing run.
  -k KIT, --kit KIT     Kit used during the sequencing run.
  --barcoding           Search for barcodes to demultiplex sequencing data.
  -c CONFIG, --config CONFIG
                        Optional configuration file to use.
  -d DATA_PATH, --data_path DATA_PATH
                        Optional path to model files.
  -b, --debug           Output additional debug information to the log.
  -r, --recursive       Recurse through subfolders for input data files.
  -n FILES_PER_BATCH_FOLDER, --files_per_batch_folder FILES_PER_BATCH_FOLDER
                        Maximum number of files in each batch subfolder. Set
                        to 0 to disable batch subfolders.
  -o OUTPUT_FORMAT, --output_format OUTPUT_FORMAT
                        desired output format, can be fastq,fast5 or only one
                        of these.
  -q READS_PER_FASTQ_BATCH, --reads_per_fastq_batch READS_PER_FASTQ_BATCH
                        number of reads per FastQ batch file. Set to 0 to
                        receive one reads per file and file names which
                        include the read ID.
```
