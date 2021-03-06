# L3 Tunnel

## IP in IP

### Topology

```
+---------------------------+
|                           |
|   +------+   +-----+      |
|   | tif0 +---+  0  |      |
|   +------+   +--+--+      |
|                 |         |
| +---------------+-------+ |
| |                       | |
| |       L3 Routing      | |
| |                       | |
| +----+-------------+----+ |
|      |             |      |
|   +--+--+       +--+--+   |
|   |  0  |       |  0  |   |
|   +--+--+       +--+--+   |
|      |             |      |
|   +--+--+       +--+--+   |
|   | if0 |       | if1 |   |
+---+--+--+-------+--+--+---+
  172.16.110.1   10.10.0.1
```

## GRE

### Topology

```
+---------------------------+
|                           |
|   +------+   +-----+      |
|   | tif0 +---+  0  |      |
|   +------+   +--+--+      |
|                 |         |
| +---------------+-------+ |
| |                       | |
| |       L3 Routing      | |
| |                       | |
| +----+-------------+----+ |
|      |             |      |
|   +--+--+       +--+--+   |
|   |  0  |       |  0  |   |
|   +--+--+       +--+--+   |
|      |             |      |
|   +--+--+       +--+--+   |
|   | if0 |       | if1 |   |
+---+--+--+-------+--+--+---+
  172.16.110.1   10.10.0.1
```

## IPsec

### Topology

```
+---------------------------+
|                           |
|   +------+   +-----+      |
|   | tif0 +---+  0  |      |
|   +------+   +--+--+      |
|                 |         |
| +---------------+-------+ |
| |                       | |
| |       L3 Routing      | |
| |                       | |
| +----+-------------+----+ |
|      |             |      |
|   +--+--+       +--+--+   |
|   |  0  |       |  0  |   |
|   +--+--+       +--+--+   |
|      |             |      |
|   +--+--+       +--+--+   |
|   | if0 |       | if1 |   |
+---+--+--+-------+--+--+---+
  172.16.110.1   10.10.0.1
```
