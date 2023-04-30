# GenomeAnalysis
Code for projects in Genome Analysis course.

## Tips on using uppmax

connect to uppmax:

```
ssh -AX username@rackham.uppmax.uu.se
```
connect to a working node (new reservation code each day)

Add the needed time in -t option (if you work after the lab hours remove --reservation and you have to wait in a queue for a time slot)
```
$ salloc -A uppmax2023-2-8 -M snowy -p core -n 2 -t 00:00:00 --reservation=<code>
```

use sbatch for sending in bash scripts to the queue:
```
#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:00:00
#SBATCH -J job_name
#SBATCH --mail-type=ALL
#SBATCH --mail-user your_email

# Load modules
module load bioinfo-tools
module load ....

# Your commands
<Command_1...>
<Command_2...>
```

Once you have written your script you need to submit it to the cluster using the following command:
```
$ sbatch sbatch_script.sh
```

To see the status of your submitted jobs you can run the following (replace “username” with your own username):
```
$ squeue -M snowy -u username
$ jobinfo -M snowy -u username
```

If we want to transfer from UPPMAX to our local computer we will do something like:
```
$ rsync -P username@rackham.UPPMAX.uu.se:/path/to/your/file .
```
