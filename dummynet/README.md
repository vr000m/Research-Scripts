The python code in this directory are wrappers around [dummynet](http://info.iet.unipi.it/~luigi/dummynet/) for modifying link characteristics.

At the moment:
* `dnet_fixed_bw.py` uses fixed values for throughput and network latency.
* `dnet_variable_bw.py` uses variable throughput (see link.txt for format), but fixed network latency.

I use the dnet_* script as follows:
```
spawns.append(subprocess.Popen(["python","dnet_fixed_bw.py", str(linkbw)+"kb", str(delay), str(sim_time), str(plr)],stdout=False,shell=False))
```

[Work in progress]
