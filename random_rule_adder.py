import random
file_name = "direct.xml"
# customer-site = None
priority = 0
with open(file_name, "w") as f:
    for i in range(10):
        # customer-site = i
        for j in range(1000):
            priority = (i * 1000) + j
            f.write('<rule priority="{0}" table="filter" ipv="ipv4" chain="FORWARD">-p tcp -s 10.8.0.{1}/32 -d 172.31.{2}.{3}/32 --dport 22 -i wg0 -o eth0 -j ACCEPT</rule>'.format(priority, (i+1), random.randint(1, 254), random.randint(1, 254)) + '\n')