interface bdg1
    {
    AdvSendAdvert on;
    MaxRtrAdvInterval 4;
    MinRtrAdvInterval 3;
    AdvCurHopLimit 0;
    AdvManagedFlag off;
    AdvOtherConfigFlag off;
    AdvDefaultLifetime 0;
    AdvReachableTime 0;
    AdvRetransTimer 0;
    AdvLinkMTU 0;
        prefix 3ffe:501:ffff:100::/64
        {
        AdvOnLink off;
        AdvAutonomous off;
        AdvValidLifetime 0;
        AdvPreferredLifetime 0;
        };
    };
