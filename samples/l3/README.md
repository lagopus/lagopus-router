# L3 + Bridges

## sample1


### Topology

```

+---------------------------+
|                           |
| +-----------------------+ |
| |                       | |
| |       L3 Routing      | |
| |                       | |
| +----+-------------+----+ |
|      |             |      |
|   +--+--+       +--+--+   |
|   | if0 |       | if1 |   |
+---+--+--+-------+--+--+---+
       |             |
       +             +
     untag         untag
     vlan 100      vlan 200

```

## sample2

### Topology


```
+--------------------------------------------------------------+
|                                                              |
| +----------------------------------------------------------+ |
| |                                                          | |
| | VRF1                                                     | |
| |                                                          | |
| +-------------+---------------------------------+----------+ |
|               |                                 |            |
| +------+  +---+----+              +------+  +---+----+       |
| | rif0 +--+ rif0.0 |              | rif1 +--+ rif1.0 |       |
| +------+  +---+----+              +------+  +---+----+       |
|               |                                 |            |
| +----------------------------------------------------------+ |
| | VSI1        |                                 |          | |
| |  +----------+------+               +----------+------+   | |
| |  |   Bridge        |               |   Bridge        |   | |
| |  |   Vlan100       |               |   Vlan200       |   | |
| |  +---+---------+---+               +----+--------+---+   | |
| |      |         |                        |        |       | |
| +----------------------------------------------------------+ |
|        |         |                        |        |         |
|        |         |    +-------------------+        |         |
|        |         |    |                            |         |
|        |         +-------------------+             |         |
|        |              |              |             |         |
|    +---+---+      +---+---+      +---+---+     +---+---+     |
|    | if0.0 |      | if1.0 |      | if2.0 |     | if2.1 |     |
|    +---+---+      +---+---+      +---+---+     +---+---+     |
|        | VID:100      | VID:200      | VID:100     | VID:200 |
|        |              |              +------+------+         |
|        |              |                     |                |
|     +--+--+        +--+--+               +--+--+             |
|     | if0 |        | if1 |               | if2 |             |
+-----+--+--+--------+--+--+---------------+--+--+-------------+
         |              |                     |
         |              |                     |
         +              +                     +
       untag           untag                 tagged
       vlan 100        vlan 200              vlan 100,200
```

## sample3

### Topology

```
+-------------------------------------------------------------------+
|                                                                   |
| +----------------------------+     +----------------------------+ |
| |                            |     |                            | |
| |  VRF1                      |     |  VRF2                      | |
| |                            |     |                            | |
| +-------------+----+---------+     +--------------+-----+-------+ |
|               |    |                              |     |         |
|               |    |                +-------------+     |         |
|               |    |                |                   |         |
|               |    +------------------------+           |         |
|               |                     |       |           |         |
| +------+  +---+----+  +------+  +---+----+  |           |         |
| | rif0 +--+ rif0.0 |  | rif1 +--+ rif1.0 |  |           |         |
| +------+  +---+----+  +------+  +---+----+  |           |         |
|               |                     |       |           |         |
| +----------------------------------------+  |           |         |
| | VSI1        |                     |    |  |           |         |
| |  +----------+---------------------+--+ |  |           |         |
| |  |   Bridge                          | |  |           |         |
| |  |   Vlan100                         | |  |           |         |
| |  +---+-------------------------------+ |  |           |         |
| |      |                                 |  |           |         |
| +----------------------------------------+  |           |         |
|        |                                    |           |         |
|    +---+---+                            +---+---+   +---+---+     |
|    | if0.0 |                            | if2.0 |   | if2.1 |     |
|    +---+---+                            +---+---+   +---+---+     |
|        | VID:100                    VID:200 |           | VID:201 |
|        |                                    +-----+-----+         |
|        |                                          |               |
|     +--+--+                                    +--+--+            |
|     | if0 |                                    | if2 |            |
+-----+--+--+------------------------------------+--+--+------------+
         |                                          |
         |                                          |
         +                                          +
       untag                                       tagged
       vlan 100                                    vlan 200,201
```