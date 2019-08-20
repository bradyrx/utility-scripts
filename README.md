# utility-scripts

Generalized shell/python scripts for simple tasks on workstations.

# Analysis Environment

On a new cluster, run `conda env create -f environments/analysis.yml` to install all
of the necessary packages for an analysis environment.

# Dask Dashbaord in Jupyter Lab

The most direct way to get the dask dashboard working is to rely on the `jupyter-server-proxy`
package and the `dask-labextension`. The former allows dashboards to be used from jupyter
without having to worry about ssh tunneling. The latter adds a nice dask dashboard that
can be dragged and dropped in your jupyter lab.

Both will be installed in the analysis environment. After installing the analysis environment,
run `source activate analysis` and then run `jupyter labextension install dask-labextension`. **Note: This only needs to be run once.** It will install the dask dashboardon jupyter lab. 

You can launch your jupyter lab instance (after connecting to a compute node and activating `analysis`) by using the utility scripts here. Reach out to me if your cluster isn't supported here.

E.g., on the Casper DAV at NCAR:

```bash
execdav
source activate analysis
./utility_scripts/cheyenne/launch_jupyterlab
# enter in the port to host the jupyterlab server on
8889
```

Then connect to `localhost:8889` in your browser. You can launch a simple cluster of dask workers with the following:

```python
import dask_jobqueue
from dask.distributed import Client
from dask_jobqueue import SLURMCluster



NUMNODES=1 # Number of nodes to request
PROCESSES=24 # Number of workers per node (max 24)

cluster = SLURMCluster(cores=24, memory="100 GB", processes=PROCESSES, walltime='00:30:00',)
cluster.scale(NUMNODES*PROCESSES) # Request worker load

client = Client(cluster)
client
```

You should notice the dask dashboard light up on the lefthand side after executing the first cluster command. If it doesn't, execute through "client" and then copy and paste the server name (e.g., `/proxy/8787/`) into the dask dashboard at the top and click the magnifying glass.

![](https://i.imgur.com/I2eHDBd.png)
