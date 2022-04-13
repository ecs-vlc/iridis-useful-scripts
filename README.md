# Iridis Useful Scripts

This repository is designed to help people using the Iridis Supercomputer at the University of Southampton.
Feel free to share what scripts you are using and might be useful for other people!

## Contents
* [Useful external resources](#useful-external-resources)
* [GPU availability status](#gpu-availability-status)

## Useful external resources
[Princeton University supercomputer](https://researchcomputing.princeton.edu/support/knowledge-base/pytorch) \
Note: even if the partitions are named different, most of the examples can be easily adapted to Iridis 5.\
There are a lot of examples with links to Pytorch implementations (e.g. Distributed training) \
[Iridis 5 University of Southampton](https://hpc.soton.ac.uk/redmine/projects/iridis-5-support/wiki)

## GPU availability status
Check the availability of the GPU nodes (gtx1080, gpu, ecsstaff, ecsstudent).
- Nodes containing *Nvidia 1080ti* and *Tesla v100* GPUs are locked when a user is granted access. This means that even if the 
user uses only 1 out of 4 available GPUs ( e.g. gtx1080 nodes) the others are not available to any other users.
- Nodes containing *Nvidia rtx8000* GPUs are shared, meaning that if a user is granted access to 1 out of 2
GPUs available, the other GPU is still accessible by other users (this implies shared CPU and RAM). 

```bash
# Run the following script to get the availabilty of the GPUs
./status.sh
```

To make things easier, you can define an alias that runs the  [`status.sh`](./status.sh) script.
```bash
# 1. Place the script in your $HOME folder
mv status.sh $HOME

# 2. Open the ~/.bashrc file and add the following line
vim ~/.bashrc
alias status=". $HOME/status.sh"

# 3. Run the file
. ~/.bashrc
```
Now in your terminal you can run:
```bash
status
#example output:
# >STATUS v100 GPUS: 4/10 nodes are in use
# >STATUS 1080TI GPUS: 3/10 nodes are in use
# >STATUS rtx8000 GPUS: 2/12 staff GPUS are in use
# >STATUS rtx8000 GPUS: 1/8 student GPUS are in use
```


## Monitoring slrum job output
If you want to monitor the output of you job in real time, you can run the 'tail' command every 1 second and keep displaying
the most recent 50 lines. This can be useful for faster debugging.

```bash
# Add the following line in  ~/.bashrc 
alias analyse="watch -n 1 tail -n 50"

# example use:
analyse slurm-1294659.out
```


