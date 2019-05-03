interface bdg1
    {
    AdvSendAdvert on;
    MaxRtrAdvInterval 1800;
    MinRtrAdvInterval 1350;
    AdvCurHopLimit 255;
    AdvManagedFlag on;
    AdvOtherConfigFlag on;
    AdvDefaultLifetime 9000;
    AdvReachableTime 3600000;
    AdvRetransTimer 4294967295;
    AdvLinkMTU 1500;
        prefix 3ffe:501:ffff:100::/64
        {
        AdvOnLink on;
        AdvAutonomous on;
        AdvValidLifetime 4294967295;
        AdvPreferredLifetime 4294967295;
        };
    };
