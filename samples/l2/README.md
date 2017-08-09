# l2 sample

## Topology

```
+--------------------------------------------------------------+
|                                                              |
| +----------------------------------------------------------+ |
| | VSI1                                                     | |
| |  +-----------------+               +-----------------+   | |
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