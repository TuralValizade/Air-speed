void limits()
{
int[] surets = { 
  60,62,64,66,68, 70,72,74,76,78, 80,82,84,86,88, 90,92,94,96,98 , 100 ,102,104,106,108, 110,112,114,116,118 , 120 ,122,124,126,128, 130,132,134,136,138 , 140,142,144,146,148 , 150 ,152,154,156,158, 160,162,164,166,168, 170,172,174,176,178 , 180 ,182,184,186,188, 190 ,192,194,196,198, 200 ,202,204,206,208, 210,212,214,216,218 ,220 ,222,224,226,228, 230 ,232,234,236,238, 240 ,242,244,246,248, 250 ,260,270,280,290, 300 ,310,320,330,340, 350,360,370,380,390 , 400 ,410,420,430,440, 450
};
float [] derece = {270,272.605263158,275.210526316,277.815789474,280.421052632,283.02631579,285.631578948,288.236842106,290.842105264,293.447368422,296.052631579,298.657894738,301.263157896,303.868421054,306.473684212,309.078947368,311.684210528,314.289473686,316.894736844,319.500000002,322.105263158,324.710526317,327.315789475,329.921052633,332.526315791,335.131578948,337.736842107,340.342105265,342.947368423,345.552631581
,348.157894738,350.763157896,353.368421054,355.973684212,358.57894737,361.184210527,3.7894736859,6.3947368438,9.0000000017,11.6052631596,14.2105263155,16.8157894754,19.4210526333,22.0263157912,24.6315789491,27.236842105,29.8421052649,32.4473684228,35.0526315807,37.6578947386,40.2631578945,42.8684210544,45.4736842123,48.0789473702,50.6842105281,53.289473684,55.8947368439,58.5000000018,61.1052631597,63.7105263176,66.3157894735,68.9210526334,71.5263157913,74.1315789492,76.7368421071,79.342105263,81.9473684229,84.5526315808,87.1578947387,89.7631578966,92.3684210525,94.9736842124,97.5789473703,100.184210528,102.789473686,105.394736842,108.000000002,110.60526316,113.210526318,115.815789476,118.421052632,121.026315791,123.631578949,126.236842107,128.842105265,131.447368421,134.052631581,136.657894739,139.263157897,141.868421055,144.47368421,147.07894737,149.684210528,152.289473686,154.894736844,157.5,162,166.5,171,175.5,180,184.5,189,193.5,198,202.3,207,211.5,216,220.5,225,229.5,234,238.5,243,247.7
};

int s = java.util.Arrays.binarySearch(surets,Limit);

if (s>=0)
{
a = derece[s];
w = surets[s];
}
}
