interface bdg1
    {
    AdvSendAdvert on;
    MaxRtrAdvInterval 600;
    MinRtrAdvInterval 200;
    AdvCurHopLimit 64;
    AdvManagedFlag off;
    AdvOtherConfigFlag off;
    AdvDefaultLifetime 1800;
    AdvReachableTime 30000;
    AdvRetransTimer 1000;
    AdvLinkMTU 1500;
        prefix 3ffe:501:ffff:100::/64
        {
        AdvOnLink on;
        AdvAutonomous on;
        AdvValidLifetime 2592000;
        AdvPreferredLifetime 604800;
        };
    };
