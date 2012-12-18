%nprocshared=4
%mem=2GB
%chk=ts.chk
#  oniom(b3lyp/6-31g(d):amber)=embed geom=connectivity scf=xqc

Title Card Required

6 1 -1 1 -1 1
 N-N3--0.202000(PDBName=N,ResName=PRO,ResNum=1)               0     18.790401     27.328099     63.636696  L
 H-H-0.312000(PDBName=H2,ResName=PRO,ResNum=1)                0     18.791833     28.001790     62.863660  L
 H-H-0.312000(PDBName=H3,ResName=PRO,ResNum=1)                0     19.537366     27.619275     64.261135  L
 C-CT--0.012000(PDBName=CD,ResName=PRO,ResNum=1)              0     17.430512     27.345173     64.192626  L
 H-HP-0.100000(PDBName=2HD,ResName=PRO,ResNum=1)              0     17.053221     28.372349     64.220002  L
 H-HP-0.100000(PDBName=3HD,ResName=PRO,ResNum=1)              0     17.426499     26.915880     65.195809  L
 C-CT--0.121000(PDBName=CG,ResName=PRO,ResNum=1)              0     16.577539     26.483382     63.248731  L
 H-HC-0.100000(PDBName=2HG,ResName=PRO,ResNum=1)              0     15.957024     27.126418     62.618290  L
 H-HC-0.100000(PDBName=3HG,ResName=PRO,ResNum=1)              0     15.949979     25.797182     63.819623  L
 C-CT--0.115000(PDBName=CB,ResName=PRO,ResNum=1)              0     17.592720     25.724071     62.373150  L
 H-HC-0.100000(PDBName=2HB,ResName=PRO,ResNum=1)              0     17.641361     26.190750     61.384398  L
 H-HC-0.100000(PDBName=3HB,ResName=PRO,ResNum=1)              0     17.349694     24.664150     62.281392  L
 C-CT-0.100000(PDBName=CA,ResName=PRO,ResNum=1)               0     18.908806     25.956262     63.117505  L
 H-HP-0.100000(PDBName=HA,ResName=PRO,ResNum=1)               0     18.947207     25.275017     63.966492  L
 C-C-0.526000(PDBName=C,ResName=PRO,ResNum=1)                 0     20.175078     25.737488     62.281704  L
 O-O--0.500000(PDBName=O,ResName=PRO,ResNum=1)                0     20.441055     26.501196     61.358713  L
 N-N--0.415700(PDBName=N,ResName=GLN,ResNum=2)                0     20.979823     24.729194     62.647497  L
 H-H-0.271900(PDBName=H,ResName=GLN,ResNum=2)                 0     20.675055     24.083668     63.358476  L
 C-CT--0.003100(PDBName=CA,ResName=GLN,ResNum=2)              0     22.416331     24.700243     62.347682  L
 H-H1-0.085000(PDBName=HA,ResName=GLN,ResNum=2)               0     22.649714     25.555589     61.716972  L
 C-CT--0.003600(PDBName=CB,ResName=GLN,ResNum=2)              0     23.191277     24.888387     63.663272  L
 H-HC-0.017100(PDBName=2HB,ResName=GLN,ResNum=2)              0     22.808170     25.771386     64.174065  L
 H-HC-0.017100(PDBName=3HB,ResName=GLN,ResNum=2)              0     23.029452     24.024217     64.309670  L
 C-CT--0.064500(PDBName=CG,ResName=GLN,ResNum=2)              0     24.699371     25.071542     63.437089  L
 H-HC-0.035200(PDBName=2HG,ResName=GLN,ResNum=2)              0     25.122022     24.151283     63.035079  L
 H-HC-0.035200(PDBName=3HG,ResName=GLN,ResNum=2)              0     24.865927     25.871755     62.716811  L
 C-C-0.695100(PDBName=CD,ResName=GLN,ResNum=2)                0     25.428854     25.427943     64.726043  L
 O-O--0.608600(PDBName=OE1,ResName=GLN,ResNum=2)              0     25.147610     26.411711     65.384163  L
 N-N--0.940700(PDBName=NE2,ResName=GLN,ResNum=2)              0     26.393623     24.643710     65.150648  L
 H-H-0.425100(PDBName=1HE2,ResName=GLN,ResNum=2)              0     26.822573     24.977344     65.994874  L
 H-H-0.425100(PDBName=2HE2,ResName=GLN,ResNum=2)              0     26.708127     23.850418     64.614818  L
 C-C-0.597300(PDBName=C,ResName=GLN,ResNum=2)                 0     22.893466     23.438517     61.609507  L
 O-O--0.567900(PDBName=O,ResName=GLN,ResNum=2)                0     22.539664     22.306802     61.951161  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=3)                0     23.783480     23.659241     60.642020  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=3)                 0     23.962465     24.633511     60.413719  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=3)              0     24.549485     22.666500     59.897746  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=3)               0     24.373820     21.686459     60.331786  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=3)               0     24.116679     22.605003     58.408644  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=3)               0     24.445096     23.512478     57.899825  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=3)             0     24.800581     21.405915     57.728568  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=3)             0     24.640063     21.456492     56.650789  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=3)             0     25.873076     21.409302     57.913346  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=3)             0     24.369693     20.475985     58.097590  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=3)             0     22.593169     22.442905     58.183632  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=3)             0     22.428341     21.973806     57.212268  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=3)             0     22.173259     21.783393     58.944381  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=3)             0     21.811801     23.762726     58.155474  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=3)             0     21.772023     24.226967     59.138052  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=3)             0     22.280437     24.451287     57.452522  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=3)             0     20.790532     23.561419     57.833311  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=3)                 0     26.039754     22.997439     60.067685  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=3)                0     26.619437     23.755774     59.291562  L
 N-N--0.415700(PDBName=N,ResName=THR,ResNum=4)                0     26.683150     22.422757     61.084734  L
 H-H-0.271900(PDBName=H,ResName=THR,ResNum=4)                 0     26.160515     21.802819     61.697043  L
 C-CT--0.038900(PDBName=CA,ResName=THR,ResNum=4)              0     28.148585     22.343177     61.154652  L
 H-H1-0.100700(PDBName=HA,ResName=THR,ResNum=4)               0     28.574824     23.313241     60.928952  L
 C-CT-0.365400(PDBName=CB,ResName=THR,ResNum=4)               0     28.631607     21.932782     62.549140  L
 H-H1-0.004300(PDBName=HB,ResName=THR,ResNum=4)               0     28.305984     20.918439     62.782845  L
 C-CT--0.243800(PDBName=CG2,ResName=THR,ResNum=4)             0     30.151157     22.033583     62.653012  L
 H-HC-0.064200(PDBName=1HG2,ResName=THR,ResNum=4)             0     30.625176     21.391353     61.913433  L
 H-HC-0.064200(PDBName=2HG2,ResName=THR,ResNum=4)             0     30.461572     23.061317     62.468886  L
 H-HC-0.064200(PDBName=3HG2,ResName=THR,ResNum=4)             0     30.480315     21.735418     63.647893  L
 O-OH--0.676100(PDBName=OG1,ResName=THR,ResNum=4)             0     28.137157     22.835612     63.521461  L
 H-HO-0.410200(PDBName=1HG,ResName=THR,ResNum=4)              0     28.579701     22.598140     64.343672  L
 C-C-0.597300(PDBName=C,ResName=THR,ResNum=4)                 0     28.602270     21.361526     60.081781  L
 O-O--0.567900(PDBName=O,ResName=THR,ResNum=4)                0     28.198826     20.203685     60.090363  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=5)                0     29.344470     21.842066     59.085763  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=5)                 0     29.731464     22.771951     59.224192  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=5)              0     29.243488     21.377311     57.696530  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=5)               0     28.184288     21.350139     57.445808  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=5)              0     29.909245     22.421162     56.779102  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=5)              0     30.926793     22.601181     57.130925  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=5)              0     29.971058     22.020338     55.766879  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=5)               0     29.139499     23.761217     56.725405  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=5)              0     29.015420     24.163683     57.729533  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=5)             0     29.930960     24.778750     55.910397  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=5)             0     29.368058     25.707830     55.843417  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=5)             0     30.870923     24.989881     56.415747  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=5)             0     30.118055     24.398568     54.905917  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=5)             0     27.757574     23.614830     56.081702  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=5)             0     27.082150     23.108657     56.766295  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=5)             0     27.334616     24.596700     55.870478  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=5)             0     27.828265     23.044006     55.160094  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=5)                 0     29.718160     19.938952     57.416219  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=5)                0     29.449013     19.427734     56.330608  L
 N-N--0.415700(PDBName=N,ResName=TRP,ResNum=6)                0     30.320770     19.248366     58.389582  L
 H-H-0.271900(PDBName=H,ResName=TRP,ResNum=6)                 0     30.440816     19.731700     59.267426  L
 C-CT--0.027500(PDBName=CA,ResName=TRP,ResNum=6)              0     30.463084     17.784648     58.385821  L
 H-H1-0.112300(PDBName=HA,ResName=TRP,ResNum=6)               0     30.998429     17.503193     57.478406  L
 C-CT--0.005000(PDBName=CB,ResName=TRP,ResNum=6)              0     31.301217     17.332584     59.591343  L
 H-HC-0.033900(PDBName=2HB,ResName=TRP,ResNum=6)              0     31.416858     16.248809     59.546309  L
 H-HC-0.033900(PDBName=3HB,ResName=TRP,ResNum=6)              0     32.296692     17.766265     59.498277  L
 C-C*--0.141500(PDBName=CG,ResName=TRP,ResNum=6)              0     30.778838     17.691558     60.948602  L
 C-CW--0.163800(PDBName=CD1,ResName=TRP,ResNum=6)             0     31.279943     18.674380     61.730021  L
 H-H4-0.206200(PDBName=HD1,ResName=TRP,ResNum=6)              0     32.124600     19.302291     61.461277  L
 N-NA--0.341800(PDBName=NE1,ResName=TRP,ResNum=6)             0     30.568463     18.725786     62.914014  L
 H-H-0.341200(PDBName=HE1,ResName=TRP,ResNum=6)               0     30.789232     19.349364     63.676566  L
 C-CN-0.138000(PDBName=CE2,ResName=TRP,ResNum=6)              0     29.571710     17.774640     62.951844  L
 C-CA--0.260100(PDBName=CZ2,ResName=TRP,ResNum=6)             0     28.606220     17.440818     63.912892  L
 H-HA-0.157200(PDBName=HZ2,ResName=TRP,ResNum=6)              0     28.532253     18.003211     64.831336  L
 C-CA--0.113400(PDBName=CH2,ResName=TRP,ResNum=6)             0     27.749236     16.353469     63.671998  L
 H-HA-0.141700(PDBName=HH2,ResName=TRP,ResNum=6)              0     27.007007     16.076413     64.408576  L
 C-CA--0.197200(PDBName=CZ3,ResName=TRP,ResNum=6)             0     27.876415     15.610991     62.484075  L
 H-HA-0.144700(PDBName=HZ3,ResName=TRP,ResNum=6)              0     27.232426     14.759060     62.315703  L
 C-CA--0.238700(PDBName=CE3,ResName=TRP,ResNum=6)             0     28.845558     15.961212     61.523253  L
 H-HA-0.170000(PDBName=HE3,ResName=TRP,ResNum=6)              0     28.943983     15.375774     60.620970  L
 C-CB-0.124300(PDBName=CD2,ResName=TRP,ResNum=6)              0     29.707363     17.064069     61.722709  L
 C-C-0.597300(PDBName=C,ResName=TRP,ResNum=6)                 0     29.112781     17.042740     58.331008  L
 O-O--0.567900(PDBName=O,ResName=TRP,ResNum=6)                0     29.040199     15.950672     57.766850  L
 N-N--0.415700(PDBName=N,ResName=GLN,ResNum=7)                0     28.042318     17.635175     58.876356  L
 H-H-0.271900(PDBName=H,ResName=GLN,ResNum=7)                 0     28.213649     18.518213     59.346468  L
 C-CT--0.003100(PDBName=CA,ResName=GLN,ResNum=7)              0     26.643804     17.207904     58.737128  L
 H-H1-0.085000(PDBName=HA,ResName=GLN,ResNum=7)               0     26.538145     16.217544     59.180719  L
 C-CT--0.003600(PDBName=CB,ResName=GLN,ResNum=7)              0     25.733847     18.201724     59.496209  L
 H-HC-0.017100(PDBName=2HB,ResName=GLN,ResNum=7)              0     25.968755     19.207370     59.151193  L
 H-HC-0.017100(PDBName=3HB,ResName=GLN,ResNum=7)              0     24.691814     18.001812     59.245905  L
 C-CT--0.064500(PDBName=CG,ResName=GLN,ResNum=7)              0     25.854986     18.166889     61.031100  L
 H-HC-0.035200(PDBName=2HG,ResName=GLN,ResNum=7)              0     25.463828     17.222264     61.407527  L
 H-HC-0.035200(PDBName=3HG,ResName=GLN,ResNum=7)              0     26.903973     18.237463     61.315743  L
 C-C-0.695100(PDBName=CD,ResName=GLN,ResNum=7)                0     25.104895     19.322471     61.700174  L
 O-O--0.608600(PDBName=OE1,ResName=GLN,ResNum=7)              0     25.668869     20.144590     62.400633  L
 N-N--0.940700(PDBName=NE2,ResName=GLN,ResNum=7)              0     23.811116     19.469033     61.499894  L
 H-H-0.425100(PDBName=1HE2,ResName=GLN,ResNum=7)              0     23.410949     20.298047     61.930387  L
 H-H-0.425100(PDBName=2HE2,ResName=GLN,ResNum=7)              0     23.267527     18.846643     60.937832  L
 C-C-0.597300(PDBName=C,ResName=GLN,ResNum=7)                 0     26.211241     17.112450     57.254560  L
 O-O--0.567900(PDBName=O,ResName=GLN,ResNum=7)                0     26.951189     17.479264     56.335322  L
 N-N--0.347900(PDBName=N,ResName=ARG,ResNum=8)                0     24.979969     16.636817     57.001731  L
 H-H-0.274700(PDBName=H,ResName=ARG,ResNum=8)                 0     24.407148     16.401673     57.796207  L
 C-CT--0.263700(PDBName=CA,ResName=ARG,ResNum=8)              0     24.375229     16.666645     55.658050  L
 H-H1-0.156000(PDBName=HA,ResName=ARG,ResNum=8)               0     25.024842     16.104540     54.990290  L
 C-CT--0.000700(PDBName=CB,ResName=ARG,ResNum=8)              0     22.970923     16.023534     55.623520  L
 H-HC-0.032700(PDBName=2HB,ResName=ARG,ResNum=8)              0     22.240282     16.711957     56.052069  L
 H-HC-0.032700(PDBName=3HB,ResName=ARG,ResNum=8)              0     22.728188     15.879341     54.571464  L
 C-CT-0.039000(PDBName=CG,ResName=ARG,ResNum=8)               0     22.808505     14.668272     56.325155  L
 H-HC-0.028500(PDBName=2HG,ResName=ARG,ResNum=8)              0     23.684912     14.055170     56.110584  L
 H-HC-0.028500(PDBName=3HG,ResName=ARG,ResNum=8)              0     22.747437     14.819330     57.403548  L
 C-CT-0.048600(PDBName=CD,ResName=ARG,ResNum=8)               0     21.562844     13.900550     55.838190  L
 H-H1-0.068700(PDBName=2HD,ResName=ARG,ResNum=8)              0     21.672740     13.699467     54.770546  L
 H-H1-0.068700(PDBName=3HD,ResName=ARG,ResNum=8)              0     21.551677     12.930532     56.339064  L
 N-N2--0.529500(PDBName=NE,ResName=ARG,ResNum=8)              0     20.265087     14.573408     56.106178  L
 H-H-0.345600(PDBName=HE,ResName=ARG,ResNum=8)                0     19.914037     14.541121     57.046635  L
 C-CA-0.807600(PDBName=CZ,ResName=ARG,ResNum=8)               0     19.381826     14.968202     55.196091  L
 N-N2--0.862700(PDBName=NH1,ResName=ARG,ResNum=8)             0     19.709372     15.133409     53.956099  L
 H-H-0.447800(PDBName=1HH1,ResName=ARG,ResNum=8)              0     20.634745     15.493858     53.805267  L
 H-H-0.447800(PDBName=2HH1,ResName=ARG,ResNum=8)              0     18.974327     15.535851     53.368802  L
 N-N2--0.862700(PDBName=NH2,ResName=ARG,ResNum=8)             0     18.140217     15.210788     55.506871  L
 H-H-0.447800(PDBName=1HH2,ResName=ARG,ResNum=8)              0     17.758740     15.078434     56.420883  L
 H-H-0.447800(PDBName=2HH2,ResName=ARG,ResNum=8)              0     17.490282     15.472174     54.752948  L
 C-C-0.734100(PDBName=C,ResName=ARG,ResNum=8)                 0     24.279962     18.128466     55.167878  L
 O-O--0.589400(PDBName=O,ResName=ARG,ResNum=8)                0     23.615624     18.913021     55.840219  L
 N-N--0.254800(PDBName=N,ResName=PRO,ResNum=9)                0     24.911772     18.516677     54.041405  L
 C-CT-0.019200(PDBName=CD,ResName=PRO,ResNum=9)               0     25.832738     17.727810     53.227064  L
 H-H1-0.039100(PDBName=2HD,ResName=PRO,ResNum=9)              0     25.369544     16.800789     52.887433  L
 H-H1-0.039100(PDBName=3HD,ResName=PRO,ResNum=9)              0     26.730148     17.507111     53.803284  L
 C-CT-0.018900(PDBName=CG,ResName=PRO,ResNum=9)               0     26.202148     18.598850     52.022930  L
 H-HC-0.021300(PDBName=2HG,ResName=PRO,ResNum=9)              0     25.537381     18.380525     51.186656  L
 H-HC-0.021300(PDBName=3HG,ResName=PRO,ResNum=9)              0     27.238234     18.453648     51.718793  L
 C-CT--0.007000(PDBName=CB,ResName=PRO,ResNum=9)              0     25.949855     20.017316     52.534894  L
 H-HC-0.025300(PDBName=2HB,ResName=PRO,ResNum=9)              0     25.749941     20.717386     51.727208  L
 H-HC-0.025300(PDBName=3HB,ResName=PRO,ResNum=9)              0     26.808592     20.350197     53.117921  L
 C-CT--0.026600(PDBName=CA,ResName=PRO,ResNum=9)              0     24.754084     19.858475     53.472766  L
 H-H1-0.064100(PDBName=HA,ResName=PRO,ResNum=9)               0     24.804043     20.617625     54.254909  L
 C-C-0.589600(PDBName=C,ResName=PRO,ResNum=9)                 0     23.403668     19.994416     52.749021  L
 O-O--0.574800(PDBName=O,ResName=PRO,ResNum=9)                0     22.749893     21.031959     52.817622  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=10)               0     22.995625     18.920833     52.062253  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=10)                0     23.643060     18.151710     52.063464  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=10)             0     21.629815     18.608381     51.651827  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=10)              0     21.215746     19.419086     51.065590  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=10)             0     21.692319     17.332525     50.786929  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=10)             0     22.485359     17.434198     50.043851  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=10)             0     21.963060     16.496300     51.433151  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=10)              0     20.371835     17.007005     50.062441  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=10)             0     19.527937     17.384532     50.637463  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=10)            0     20.353372     17.634362     48.668869  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=10)            0     21.119099     17.181316     48.039381  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=10)            0     19.376446     17.480386     48.209721  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=10)            0     20.547479     18.699395     48.736810  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=10)            0     20.218845     15.495349     49.891498  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=10)            0     19.318585     15.278773     49.316624  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=10)            0     21.082392     15.083213     49.369607  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=10)            0     20.120912     15.026356     50.870255  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=10)                0     20.765460     18.396309     52.904049  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=10)               0     21.081391     17.501904     53.690248  L
 N-N--0.415700(PDBName=N,ResName=VAL,ResNum=11)               0     19.704328     19.182812     53.092408  L
 H-H-0.271900(PDBName=H,ResName=VAL,ResNum=11)                0     19.528476     19.920373     52.415580  L
 C-CT--0.087500(PDBName=CA,ResName=VAL,ResNum=11)             0     18.729911     19.029719     54.190052  L
 H-H1-0.096900(PDBName=HA,ResName=VAL,ResNum=11)              0     18.796767     18.006798     54.557723  L
 C-CT-0.298500(PDBName=CB,ResName=VAL,ResNum=11)              0     19.018515     19.970131     55.381478  L
 H-HC--0.029700(PDBName=HB,ResName=VAL,ResNum=11)             0     18.327847     19.713634     56.185769  L
 C-CT--0.319200(PDBName=CG1,ResName=VAL,ResNum=11)            0     20.432286     19.794796     55.944209  L
 H-HC-0.079100(PDBName=1HG1,ResName=VAL,ResNum=11)            0     21.173253     20.152903     55.228009  L
 H-HC-0.079100(PDBName=2HG1,ResName=VAL,ResNum=11)            0     20.535484     20.363579     56.867519  L
 H-HC-0.079100(PDBName=3HG1,ResName=VAL,ResNum=11)            0     20.621428     18.743246     56.155180  L
 C-CT--0.319200(PDBName=CG2,ResName=VAL,ResNum=11)            0     18.800927     21.445888     55.040374  L
 H-HC-0.079100(PDBName=1HG2,ResName=VAL,ResNum=11)            0     19.415457     21.713092     54.183437  L
 H-HC-0.079100(PDBName=2HG2,ResName=VAL,ResNum=11)            0     17.754510     21.632037     54.797589  L
 H-HC-0.079100(PDBName=3HG2,ResName=VAL,ResNum=11)            0     19.075340     22.064121     55.894541  L
 C-C-0.597300(PDBName=C,ResName=VAL,ResNum=11)                0     17.287053     19.212725     53.710760  L
 O-O--0.567900(PDBName=O,ResName=VAL,ResNum=11)               0     17.026884     19.686009     52.604348  L
 N-N--0.415700(PDBName=N,ResName=THR,ResNum=12)               0     16.332862     18.833611     54.558759  L
 H-H-0.271900(PDBName=H,ResName=THR,ResNum=12)                0     16.604441     18.397653     55.426011  L
 C-CT--0.038900(PDBName=CA,ResName=THR,ResNum=12)             0     14.898219     18.805553     54.256417  L
 H-H1-0.100700(PDBName=HA,ResName=THR,ResNum=12)              0     14.769708     18.250761     53.327708  L
 C-CT-0.365400(PDBName=CB,ResName=THR,ResNum=12)              0     14.141257     18.057311     55.364598  L
 H-H1-0.004300(PDBName=HB,ResName=THR,ResNum=12)              0     13.973494     18.728119     56.208162  L
 C-CT--0.243800(PDBName=CG2,ResName=THR,ResNum=12)            0     12.798829     17.525867     54.868184  L
 H-HC-0.064200(PDBName=1HG2,ResName=THR,ResNum=12)            0     12.167834     18.351378     54.541517  L
 H-HC-0.064200(PDBName=2HG2,ResName=THR,ResNum=12)            0     12.955025     16.839071     54.034899  L
 H-HC-0.064200(PDBName=3HG2,ResName=THR,ResNum=12)            0     12.299977     16.995568     55.679145  L
 O-OH--0.676100(PDBName=OG1,ResName=THR,ResNum=12)            0     14.889386     16.949243     55.822945  L
 H-HO-0.410200(PDBName=1HG,ResName=THR,ResNum=12)             0     15.199731     16.456448     55.025168  L
 C-C-0.597300(PDBName=C,ResName=THR,ResNum=12)                0     14.310581     20.210267     54.076209  L
 O-O--0.567900(PDBName=O,ResName=THR,ResNum=12)               0     14.514467     21.101917     54.905931  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=13)               0     13.547110     20.396514     52.999006  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=13)                0     13.389017     19.586559     52.407150  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=13)             0     12.909826     21.654794     52.586189  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=13)              0     12.887910     22.326974     53.442253  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=13)              0     13.716441     22.335135     51.449826  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=13)              0     13.201118     23.264254     51.202251  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=13)            0     15.132492     22.732071     51.898577  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=13)            0     15.596668     23.373075     51.150377  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=13)            0     15.084405     23.277022     52.837657  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=13)            0     15.753150     21.848487     52.041711  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=13)            0     13.776027     21.463363     50.172417  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=13)            0     14.622359     20.778070     50.228769  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=13)            0     12.871390     20.866480     50.080088  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=13)            0     13.880751     22.305201     48.899565  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=13)            0     13.935713     21.653686     48.027704  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=13)            0     13.007347     22.949987     48.812382  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=13)            0     14.773523     22.918876     48.938137  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=13)                0     11.451374     21.438330     52.141109  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=13)               0     10.989755     20.304958     52.016364  L
 N-N--0.347900(PDBName=N,ResName=ARG,ResNum=14)               0     10.741095     22.519041     51.807660  L
 H-H-0.274700(PDBName=H,ResName=ARG,ResNum=14)                0     11.189424     23.412464     52.003934  L
 C-CT--0.263700(PDBName=CA,ResName=ARG,ResNum=14)             0      9.439536     22.526505     51.117306  L
 H-H1-0.156000(PDBName=HA,ResName=ARG,ResNum=14)              0      9.307793     21.581312     50.593187  L
 C-CT--0.000700(PDBName=CB,ResName=ARG,ResNum=14)             0      8.325588     22.714723     52.152834  L
 H-HC-0.032700(PDBName=2HB,ResName=ARG,ResNum=14)             0      8.551943     22.099727     53.025815  L
 H-HC-0.032700(PDBName=3HB,ResName=ARG,ResNum=14)             0      8.313510     23.763674     52.445014  L
 C-CT-0.039000(PDBName=CG,ResName=ARG,ResNum=14)              0      6.917490     22.365280     51.659920  L
 H-HC-0.028500(PDBName=2HG,ResName=ARG,ResNum=14)             0      6.706236     22.870602     50.718596  L
 H-HC-0.028500(PDBName=3HG,ResName=ARG,ResNum=14)             0      6.854908     21.288546     51.514265  L
 C-CT-0.048600(PDBName=CD,ResName=ARG,ResNum=14)              0      5.868763     22.806130     52.688460  L
 H-H1-0.068700(PDBName=2HD,ResName=ARG,ResNum=14)             0      5.937965     23.887168     52.824862  L
 H-H1-0.068700(PDBName=3HD,ResName=ARG,ResNum=14)             0      4.868605     22.582679     52.317382  L
 N-N2--0.529500(PDBName=NE,ResName=ARG,ResNum=14)             0      6.085230     22.144983     53.982102  L
 H-H-0.345600(PDBName=HE,ResName=ARG,ResNum=14)               0      6.694432     22.597262     54.666693  L
 C-CA-0.807600(PDBName=CZ,ResName=ARG,ResNum=14)              0      5.743406     20.932038     54.352845  L
 N-N2--0.862700(PDBName=NH1,ResName=ARG,ResNum=14)            0      6.140795     20.523616     55.519442  L
 H-H-0.447800(PDBName=1HH1,ResName=ARG,ResNum=14)             0      6.772156     21.178647     56.000636  L
 H-H-0.447800(PDBName=2HH1,ResName=ARG,ResNum=14)             0      5.943415     19.621785     55.897792  L
 N-N2--0.862700(PDBName=NH2,ResName=ARG,ResNum=14)            0      5.044316     20.128981     53.595501  L
 H-H-0.447800(PDBName=1HH2,ResName=ARG,ResNum=14)             0      4.788876     20.433581     52.660208  L
 H-H-0.447800(PDBName=2HH2,ResName=ARG,ResNum=14)             0      4.779566     19.223131     53.923051  L
 C-C-0.734100(PDBName=C,ResName=ARG,ResNum=14)                0      9.383511     23.667458     50.111012  L
 O-O--0.589400(PDBName=O,ResName=ARG,ResNum=14)               0      9.926431     24.733586     50.392246  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=15)               0      8.677199     23.480328     48.994627  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=15)                0      8.277460     22.558332     48.844685  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=15)             0      8.370157     24.555292     48.035522  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=15)              0      8.472085     25.509944     48.554463  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=15)              0      9.349079     24.573924     46.835785  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=15)              0      9.087113     23.759332     46.158827  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=15)            0      9.163877     25.913468     46.095900  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=15)            0      8.136319     26.021875     45.752367  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=15)            0      9.408638     26.748319     46.753060  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=15)            0      9.810045     25.958152     45.222954  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=15)            0     10.824050     24.373910     47.262352  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=15)            0     11.112343     25.140880     47.979972  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=15)            0     10.921400     23.400643     47.742162  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=15)            0     11.827420     24.385991     46.109244  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=15)            0     11.924416     25.392692     45.706165  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=15)            0     12.803705     24.066609     46.474936  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=15)            0     11.496754     23.703118     45.327984  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=15)                0      6.913192     24.432996     47.570170  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=15)               0      6.491176     23.387409     47.073520  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=16)               0      6.116192     25.482365     47.780865  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=16)                0      6.535464     26.287100     48.239468  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=16)             0      4.675621     25.536929     47.508448  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=16)             0      4.347740     26.576534     47.531177  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=16)             0      4.473340     25.135380     46.515582  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=16)                0      3.852368     24.752292     48.535208  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=16)               0      3.011443     25.312726     49.227454  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=17)               0      4.113398     23.448337     48.625235  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=17)                0      4.877449     23.140953     48.033254  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=17)             0      3.462380     22.481315     49.515568  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=17)             0      3.338693     22.921454     50.505365  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=17)             0      2.474628     22.234777     49.124945  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=17)                0      4.271839     21.186882     49.646151  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=17)               0      4.424891     20.650152     50.747316  L
 N-N--0.415700(PDBName=N,ResName=GLN,ResNum=18)               0      4.824108     20.718443     48.522484  L
 H-H-0.271900(PDBName=H,ResName=GLN,ResNum=18)                0      4.640933     21.225999     47.672253  L
 C-CT--0.003100(PDBName=CA,ResName=GLN,ResNum=18)             0      5.649125     19.514199     48.416087  L
 H-H1-0.085000(PDBName=HA,ResName=GLN,ResNum=18)              0      5.076208     18.676460     48.816877  L
 C-CT--0.003600(PDBName=CB,ResName=GLN,ResNum=18)             0      5.980546     19.218440     46.939077  L
 H-HC-0.017100(PDBName=2HB,ResName=GLN,ResNum=18)             0      6.656476     19.988593     46.563023  L
 H-HC-0.017100(PDBName=3HB,ResName=GLN,ResNum=18)             0      6.506689     18.263504     46.893560  L
 C-CT--0.064500(PDBName=CG,ResName=GLN,ResNum=18)             0      4.764531     19.148996     45.998006  L
 H-HC-0.035200(PDBName=2HG,ResName=GLN,ResNum=18)             0      4.351548     20.149307     45.867085  L
 H-HC-0.035200(PDBName=3HG,ResName=GLN,ResNum=18)             0      5.092596     18.797134     45.019684  L
 C-C-0.695100(PDBName=CD,ResName=GLN,ResNum=18)               0      3.660543     18.236705     46.519716  L
 O-O--0.608600(PDBName=OE1,ResName=GLN,ResNum=18)             0      2.782422     18.656441     47.250250  L
 N-N--0.940700(PDBName=NE2,ResName=GLN,ResNum=18)             0      3.663661     16.964568     46.192576  L
 H-H-0.425100(PDBName=1HE2,ResName=GLN,ResNum=18)             0      2.882277     16.454506     46.569294  L
 H-H-0.425100(PDBName=2HE2,ResName=GLN,ResNum=18)             0      4.350427     16.552970     45.587964  L
 C-C-0.597300(PDBName=C,ResName=GLN,ResNum=18)                0      6.949322     19.638326     49.222785  L
 O-O--0.567900(PDBName=O,ResName=GLN,ResNum=18)               0      7.688897     20.616058     49.082011  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=19)               0      7.217526     18.638343     50.065412  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=19)                0      6.568049     17.868664     50.082446  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=19)             0      8.490619     18.446116     50.763614  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=19)              0      8.800896     19.399999     51.188059  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=19)             0      8.265380     17.422431     51.895650  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=19)             0      7.272195     17.561015     52.325737  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=19)             0      8.295544     16.422360     51.459075  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=19)              0      9.298165     17.512598     53.035576  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=19)             0     10.296339     17.659747     52.626408  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=19)            0      8.955810     18.658675     53.992399  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=19)            0      9.724605     18.732499     54.761262  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=19)            0      8.922973     19.603876     53.453630  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=19)            0      7.993017     18.480032     54.466797  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=19)            0      9.293717     16.216890     53.846015  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=19)            0      8.301461     16.023707     54.252818  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=19)            0      9.590305     15.384567     53.207162  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=19)            0     10.010399     16.291707     54.663809  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=19)                0      9.572956     17.958030     49.776686  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=19)               0      9.261658     17.229101     48.833601  L
 N-N--0.347900(PDBName=N,ResName=LYS,ResNum=20)               0     10.834757     18.344993     49.986798  L
 H-H-0.274700(PDBName=H,ResName=LYS,ResNum=20)                0     11.005978     18.918008     50.810287  L
 C-CT--0.240000(PDBName=CA,ResName=LYS,ResNum=20)             0     12.006039     17.903905     49.207724  L
 H-H1-0.142600(PDBName=HA,ResName=LYS,ResNum=20)              0     11.849372     16.856624     48.943920  L
 C-CT--0.009400(PDBName=CB,ResName=LYS,ResNum=20)             0     12.088450     18.744061     47.908789  L
 H-HC-0.036200(PDBName=2HB,ResName=LYS,ResNum=20)             0     11.099076     19.136383     47.664578  L
 H-HC-0.036200(PDBName=3HB,ResName=LYS,ResNum=20)             0     12.752275     19.594507     48.057720  L
 C-CT-0.018700(PDBName=CG,ResName=LYS,ResNum=20)              0     12.563314     17.918864     46.701010  L
 H-HC-0.010300(PDBName=2HG,ResName=LYS,ResNum=20)             0     13.553511     17.508701     46.899099  L
 H-HC-0.010300(PDBName=3HG,ResName=LYS,ResNum=20)             0     11.868783     17.092471     46.541053  L
 C-CT--0.047900(PDBName=CD,ResName=LYS,ResNum=20)             0     12.626784     18.772843     45.426873  L
 H-HC-0.062100(PDBName=2HD,ResName=LYS,ResNum=20)             0     11.639109     19.181309     45.207338  L
 H-HC-0.062100(PDBName=3HD,ResName=LYS,ResNum=20)             0     13.329455     19.592939     45.587076  L
 C-CT--0.014300(PDBName=CE,ResName=LYS,ResNum=20)             0     13.102578     17.909184     44.252377  L
 H-HP-0.113500(PDBName=2HE,ResName=LYS,ResNum=20)             0     14.018529     17.393819     44.558567  L
 H-HP-0.113500(PDBName=3HE,ResName=LYS,ResNum=20)             0     12.351313     17.149308     44.022623  L
 N-N3--0.385400(PDBName=NZ,ResName=LYS,ResNum=20)             0     13.406620     18.715901     43.048941  L
 H-H-0.340000(PDBName=1HZ,ResName=LYS,ResNum=20)              0     12.587614     19.083446     42.586299  L
 H-H-0.340000(PDBName=2HZ,ResName=LYS,ResNum=20)              0     14.042822     19.474685     43.291491  L
 H-H-0.340000(PDBName=3HZ,ResName=LYS,ResNum=20)              0     13.968368     18.151356     42.404317  L
 C-C-0.734100(PDBName=C,ResName=LYS,ResNum=20)                0     13.285638     17.958492     50.064704  L
 O-O--0.589400(PDBName=O,ResName=LYS,ResNum=20)               0     13.220620     18.147222     51.275704  L
 N-N--0.516300(PDBName=N,ResName=GLU,ResNum=21)               0     14.449948     17.817563     49.442402  L
 H-H-0.293600(PDBName=H,ResName=GLU,ResNum=21)                0     14.439951     17.701300     48.442264  L
 C-CT-0.039700(PDBName=CA,ResName=GLU,ResNum=21)              0     15.787433     17.835478     50.051324  L
 H-H1-0.110500(PDBName=HA,ResName=GLU,ResNum=21)              0     15.754830     18.269109     51.050391  L
 C-CT-0.056000(PDBName=CB,ResName=GLU,ResNum=21)              0     16.310308     16.390665     50.138678  L
 H-HC--0.017300(PDBName=2HB,ResName=GLU,ResNum=21)            0     16.006730     15.853356     49.238149  L
 H-HC--0.017300(PDBName=3HB,ResName=GLU,ResNum=21)            0     17.397709     16.399147     50.141303  L
 C-CT-0.013600(PDBName=CG,ResName=GLU,ResNum=21)              0     15.803535     15.612743     51.367468  L
 H-HC--0.042500(PDBName=2HG,ResName=GLU,ResNum=21)            0     14.731400     15.777361     51.489465  L
 H-HC--0.042500(PDBName=3HG,ResName=GLU,ResNum=21)            0     15.952459     14.548327     51.174744  L
 C-C-0.805400(PDBName=CD,ResName=GLU,ResNum=21)               0     16.545268     15.965716     52.664956  L
 O-O2--0.818800(PDBName=OE1,ResName=GLU,ResNum=21)            0     17.726646     16.364238     52.617652  L
 O-O2--0.818800(PDBName=OE2,ResName=GLU,ResNum=21)            0     16.000619     15.780519     53.776056  L
 C-C-0.536600(PDBName=C,ResName=GLU,ResNum=21)                0     16.715635     18.691830     49.174888  L
 O-O--0.581900(PDBName=O,ResName=GLU,ResNum=21)               0     16.721722     18.514117     47.953997  L
 N-N--0.415700(PDBName=N,ResName=ALA,ResNum=22)               0     17.448297     19.644985     49.764251  L
 H-H-0.271900(PDBName=H,ResName=ALA,ResNum=22)                0     17.398413     19.741129     50.776054  L
 C-CT-0.033700(PDBName=CA,ResName=ALA,ResNum=22)              0     18.275422     20.611887     49.035009  L
 H-H1-0.082300(PDBName=HA,ResName=ALA,ResNum=22)              0     18.635874     20.129778     48.127860  L
 C-CT--0.182500(PDBName=CB,ResName=ALA,ResNum=22)             0     17.398999     21.801098     48.638405  L
 H-HC-0.060300(PDBName=1HB,ResName=ALA,ResNum=22)             0     17.071766     22.326140     49.535237  L
 H-HC-0.060300(PDBName=2HB,ResName=ALA,ResNum=22)             0     17.968355     22.480291     48.003187  L
 H-HC-0.060300(PDBName=3HB,ResName=ALA,ResNum=22)             0     16.528850     21.447990     48.087151  L
 C-C-0.597300(PDBName=C,ResName=ALA,ResNum=22)                0     19.514354     21.090291     49.814918  L
 O-O--0.567900(PDBName=O,ResName=ALA,ResNum=22)               0     19.497917     21.202896     51.039095  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=23)               0     20.603801     21.347950     49.088426  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=23)                0     20.504403     21.256906     48.081790  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=23)             0     21.938317     21.685602     49.585197  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=23)              0     22.120017     21.146375     50.505864  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=23)             0     22.956568     21.210475     48.528956  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=23)             0     22.604581     20.260843     48.121823  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=23)             0     22.987372     21.927747     47.710949  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=23)              0     24.381890     20.977739     49.053811  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=23)             0     24.332620     20.327451     49.925101  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=23)            0     25.218377     20.268454     47.988219  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=23)            0     25.287889     20.884300     47.092346  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=23)            0     26.225785     20.083351     48.364514  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=23)            0     24.761426     19.314273     47.728091  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=23)            0     25.101130     22.269654     49.434317  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=23)            0     26.142698     22.047246     49.652380  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=23)            0     25.052863     22.982728     48.611778  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=23)            0     24.660688     22.706254     50.327296  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=23)                0     22.043016     23.184542     49.887012  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=23)               0     21.937742     24.002134     48.977263  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=24)               0     22.227245     23.557164     51.154244  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=24)                0     22.311645     22.827933     51.855566  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=24)             0     22.275676     24.965095     51.567846  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=24)              0     21.569590     25.531199     50.960566  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=24)             0     21.838298     25.101498     53.035470  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=24)             0     22.622417     24.693217     53.674382  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=24)             0     21.740091     26.164201     53.256536  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=24)              0     20.523063     24.388175     53.397903  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=24)             0     20.695704     23.314409     53.379998  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=24)            0     20.113282     24.795764     54.807022  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=24)            0     20.901007     24.513809     55.502016  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=24)            0     19.949308     25.872647     54.850953  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=24)            0     19.193429     24.287066     55.087461  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=24)            0     19.348422     24.709819     52.475849  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=24)            0     18.455845     24.194746     52.828536  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=24)            0     19.169065     25.783986     52.452754  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=24)            0     19.564391     24.337431     51.476900  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=24)                0     23.668845     25.566599     51.319615  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=24)               0     24.630230     25.256661     52.026761  L
 N-N--0.516300(PDBName=N,ResName=ASP,ResNum=25)               0     23.789645     26.417456     50.301486  L
 H-H-0.293600(PDBName=H,ResName=ASP,ResNum=25)                0     22.958765     26.652164     49.762744  L
 C-CT-0.038100(PDBName=CA,ResName=ASP,ResNum=25)              0     25.064793     26.834549     49.719776  L H-HC 415 0.0000
 H-H1-0.088000(PDBName=HA,ResName=ASP,ResNum=25)              0     25.864979     26.266146     50.178300  L
 C-CT--0.030300(PDBName=CB,ResName=ASP,ResNum=25)             0     25.086998     26.458978     48.236293  H
 H-HC--0.012200(PDBName=2HB,ResName=ASP,ResNum=25)            0     24.881694     25.384006     48.171994  H
 H-HC--0.012200(PDBName=3HB,ResName=ASP,ResNum=25)            0     24.264772     26.957085     47.718706  H
 C-C-0.799400(PDBName=CG,ResName=ASP,ResNum=25)               0     26.420427     26.726373     47.548025  H
 O-O2--0.801400(PDBName=OD1,ResName=ASP,ResNum=25)            0     26.334569     26.787048     46.255432  H
 O-O2--0.801400(PDBName=OD2,ResName=ASP,ResNum=25)            0     27.477231     26.838002     48.202416  H
 C-C-0.536600(PDBName=C,ResName=ASP,ResNum=25)                0     25.383824     28.319570     49.937459  L
 O-O--0.581900(PDBName=O,ResName=ASP,ResNum=25)               0     24.817465     29.206288     49.301230  L
 N-N--0.415700(PDBName=N,ResName=THR,ResNum=26)               0     26.372142     28.581766     50.797789  L
 H-H-0.271900(PDBName=H,ResName=THR,ResNum=26)                0     26.790961     27.778498     51.251137  L
 C-CT--0.038900(PDBName=CA,ResName=THR,ResNum=26)             0     27.014597     29.901671     50.959172  L
 H-H1-0.100700(PDBName=HA,ResName=THR,ResNum=26)              0     26.248301     30.606538     51.276328  L
 C-CT-0.365400(PDBName=CB,ResName=THR,ResNum=26)              0     28.075049     29.866638     52.088442  L
 H-H1-0.004300(PDBName=HB,ResName=THR,ResNum=26)              0     27.552051     29.999383     53.035188  L
 C-CT--0.243800(PDBName=CG2,ResName=THR,ResNum=26)            0     28.883405     28.575848     52.198884  L
 H-HC-0.064200(PDBName=1HG2,ResName=THR,ResNum=26)            0     28.276657     27.817868     52.686241  L
 H-HC-0.064200(PDBName=2HG2,ResName=THR,ResNum=26)            0     29.183589     28.230853     51.213088  L
 H-HC-0.064200(PDBName=3HG2,ResName=THR,ResNum=26)            0     29.769072     28.732530     52.815351  L
 O-OH--0.676100(PDBName=OG1,ResName=THR,ResNum=26)            0     29.023755     30.892400     51.984454  L
 H-HO-0.410200(PDBName=1HG,ResName=THR,ResNum=26)             0     29.667927     30.616640     51.309372  L
 C-C-0.597300(PDBName=C,ResName=THR,ResNum=26)                0     27.544346     30.464391     49.624983  L
 O-O--0.567900(PDBName=O,ResName=THR,ResNum=26)               0     27.474175     31.673042     49.379558  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=27)               0     28.024626     29.598460     48.726786  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=27)                0     27.939035     28.607643     48.932042  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=27)             0     28.517959     29.951311     47.397125  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=27)             0     29.332937     30.666317     47.506110  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=27)             0     28.908843     29.054418     46.915790  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=27)                0     27.449675     30.563082     46.482775  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=27)               0     27.677967     31.625913     45.903458  L
 N-N--0.415700(PDBName=N,ResName=ALA,ResNum=28)               0     26.304587     29.898546     46.315994  L
 H-H-0.271900(PDBName=H,ResName=ALA,ResNum=28)                0     26.177489     29.047582     46.848180  L
 C-CT-0.033700(PDBName=CA,ResName=ALA,ResNum=28)              0     25.233692     30.259049     45.384075  L
 H-H1-0.082300(PDBName=HA,ResName=ALA,ResNum=28)              0     25.667849     30.330416     44.389989  L
 C-CT--0.182500(PDBName=CB,ResName=ALA,ResNum=28)             0     24.211768     29.116983     45.371049  L
 H-HC-0.060300(PDBName=1HB,ResName=ALA,ResNum=28)             0     23.869690     28.913371     46.385202  L
 H-HC-0.060300(PDBName=2HB,ResName=ALA,ResNum=28)             0     23.354258     29.388264     44.755831  L
 H-HC-0.060300(PDBName=3HB,ResName=ALA,ResNum=28)             0     24.662713     28.213249     44.962315  L
 C-C-0.597300(PDBName=C,ResName=ALA,ResNum=28)                0     24.534931     31.602769     45.681838  L
 O-O--0.567900(PDBName=O,ResName=ALA,ResNum=28)               0     24.116620     31.880865     46.803324  L
 N-N--0.516300(PDBName=N,ResName=ASP,ResNum=29)               0     24.353357     32.426679     44.644716  L
 H-H-0.293600(PDBName=H,ResName=ASP,ResNum=29)                0     24.770887     32.167996     43.765682  L
 C-CT-0.038100(PDBName=CA,ResName=ASP,ResNum=29)              0     23.477662     33.607031     44.665566  L
 H-H1-0.088000(PDBName=HA,ResName=ASP,ResNum=29)              0     23.594985     34.115109     45.623480  L
 C-CT--0.030300(PDBName=CB,ResName=ASP,ResNum=29)             0     23.869885     34.598588     43.556073  L
 H-HC--0.012200(PDBName=2HB,ResName=ASP,ResNum=29)            0     23.635170     34.175489     42.578199  L
 H-HC--0.012200(PDBName=3HB,ResName=ASP,ResNum=29)            0     23.287764     35.513549     43.676359  L
 C-C-0.799400(PDBName=CG,ResName=ASP,ResNum=29)               0     25.355333     34.938582     43.595502  L
 O-O2--0.801400(PDBName=OD1,ResName=ASP,ResNum=29)            0     26.101433     34.360469     42.773897  L
 O-O2--0.801400(PDBName=OD2,ResName=ASP,ResNum=29)            0     25.781810     35.707510     44.487998  L
 C-C-0.536600(PDBName=C,ResName=ASP,ResNum=29)                0     22.001219     33.189504     44.541156  L
 O-O--0.581900(PDBName=O,ResName=ASP,ResNum=29)               0     21.241003     33.296737     45.498419  L
 N-N--0.516300(PDBName=N,ResName=ASP,ResNum=30)               0     21.582695     32.694862     43.373983  L
 H-H-0.293600(PDBName=H,ResName=ASP,ResNum=30)                0     22.254115     32.607269     42.629482  L
 C-CT-0.038100(PDBName=CA,ResName=ASP,ResNum=30)              0     20.263390     32.094861     43.168548  L
 H-H1-0.088000(PDBName=HA,ResName=ASP,ResNum=30)              0     19.535564     32.660999     43.741088  L
 C-CT--0.030300(PDBName=CB,ResName=ASP,ResNum=30)             0     19.863127     32.143658     41.688866  L
 H-HC--0.012200(PDBName=2HB,ResName=ASP,ResNum=30)            0     20.726544     31.906174     41.063735  L
 H-HC--0.012200(PDBName=3HB,ResName=ASP,ResNum=30)            0     19.114887     31.369789     41.520586  L
 C-C-0.799400(PDBName=CG,ResName=ASP,ResNum=30)               0     19.231523     33.462777     41.245766  L
 O-O2--0.801400(PDBName=OD1,ResName=ASP,ResNum=30)            0     18.113637     33.796663     41.704596  L
 O-O2--0.801400(PDBName=OD2,ResName=ASP,ResNum=30)            0     19.765553     34.100707     40.313154  L
 C-C-0.536600(PDBName=C,ResName=ASP,ResNum=30)                0     20.204293     30.626553     43.624146  L
 O-O--0.581900(PDBName=O,ResName=ASP,ResNum=30)               0     21.128848     29.848128     43.396550  L
 N-N--0.415700(PDBName=N,ResName=THR,ResNum=31)               0     19.061061     30.236518     44.188088  L
 H-H-0.271900(PDBName=H,ResName=THR,ResNum=31)                0     18.378078     30.962554     44.359491  L
 C-CT--0.038900(PDBName=CA,ResName=THR,ResNum=31)             0     18.626936     28.839919     44.359099  L
 H-H1-0.100700(PDBName=HA,ResName=THR,ResNum=31)              0     19.395660     28.284294     44.892894  L
 C-CT-0.365400(PDBName=CB,ResName=THR,ResNum=31)              0     17.324682     28.823306     45.173698  L
 H-H1-0.004300(PDBName=HB,ResName=THR,ResNum=31)              0     16.608896     29.508297     44.717724  L
 C-CT--0.243800(PDBName=CG2,ResName=THR,ResNum=31)            0     16.659923     27.452423     45.283618  L
 H-HC-0.064200(PDBName=1HG2,ResName=THR,ResNum=31)            0     16.257451     27.156991     44.317007  L
 H-HC-0.064200(PDBName=2HG2,ResName=THR,ResNum=31)            0     17.380072     26.709040     45.605874  L
 H-HC-0.064200(PDBName=3HG2,ResName=THR,ResNum=31)            0     15.846677     27.488243     46.005266  L
 O-OH--0.676100(PDBName=OG1,ResName=THR,ResNum=31)            0     17.601850     29.276091     46.477207  L
 H-HO-0.410200(PDBName=1HG,ResName=THR,ResNum=31)             0     17.537441     30.251609     46.457970  L
 C-C-0.597300(PDBName=C,ResName=THR,ResNum=31)                0     18.387686     28.167483     43.003329  L
 O-O--0.567900(PDBName=O,ResName=THR,ResNum=31)               0     17.672383     28.730001     42.173535  L
 N-N--0.415700(PDBName=N,ResName=VAL,ResNum=32)               0     18.916611     26.956725     42.793016  L
 H-H-0.271900(PDBName=H,ResName=VAL,ResNum=32)                0     19.415655     26.528366     43.569611  L
 C-CT--0.087500(PDBName=CA,ResName=VAL,ResNum=32)             0     18.824429     26.172324     41.545719  L
 H-H1-0.096900(PDBName=HA,ResName=VAL,ResNum=32)              0     18.027339     26.599352     40.945709  L
 C-CT-0.298500(PDBName=CB,ResName=VAL,ResNum=32)              0     20.117775     26.303850     40.715682  L
 H-HC--0.029700(PDBName=HB,ResName=VAL,ResNum=32)             0     20.256256     27.362490     40.490680  L
 C-CT--0.319200(PDBName=CG1,ResName=VAL,ResNum=32)            0     21.381913     25.820883     41.435088  L
 H-HC-0.079100(PDBName=1HG1,ResName=VAL,ResNum=32)            0     22.247535     25.966429     40.792167  L
 H-HC-0.079100(PDBName=2HG1,ResName=VAL,ResNum=32)            0     21.531587     26.396034     42.348553  L
 H-HC-0.079100(PDBName=3HG1,ResName=VAL,ResNum=32)            0     21.304040     24.761200     41.678474  L
 C-CT--0.319200(PDBName=CG2,ResName=VAL,ResNum=32)            0     20.005868     25.569015     39.375727  L
 H-HC-0.079100(PDBName=1HG2,ResName=VAL,ResNum=32)            0     19.145524     25.938271     38.817658  L
 H-HC-0.079100(PDBName=2HG2,ResName=VAL,ResNum=32)            0     20.911001     25.738620     38.794906  L
 H-HC-0.079100(PDBName=3HG2,ResName=VAL,ResNum=32)            0     19.899958     24.495711     39.534655  L
 C-C-0.597300(PDBName=C,ResName=VAL,ResNum=32)                0     18.440446     24.710020     41.812719  L
 O-O--0.567900(PDBName=O,ResName=VAL,ResNum=32)               0     18.998953     24.057431     42.686517  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=33)               0     17.446793     24.202052     41.085039  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=33)                0     17.027571     24.817004     40.396608  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=33)             0     16.694907     22.970484     41.352876  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=33)              0     17.256088     22.315546     42.015000  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=33)             0     15.348596     23.351327     42.003891  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=33)             0     14.735681     23.781474     41.215095  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=33)             0     14.852691     22.439238     42.332113  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=33)              0     15.367847     24.362751     43.168487  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=33)             0     15.887323     25.273363     42.875246  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=33)            0     13.934854     24.743688     43.526149  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=33)            0     13.942196     25.420186     44.378660  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=33)            0     13.467797     25.243189     42.679728  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=33)            0     13.372204     23.849483     43.778645  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=33)            0     16.000289     23.812759     44.442469  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=33)            0     15.431154     22.953581     44.791061  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=33)            0     17.027531     23.522269     44.242511  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=33)            0     16.005257     24.578550     45.215936  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=33)                0     16.405166     22.210670     40.046597  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=33)               0     16.427369     22.810826     38.972122  L
 N-N--0.516300(PDBName=N,ResName=GLU,ResNum=34)               0     16.069715     20.920273     40.118957  L
 H-H-0.293600(PDBName=H,ResName=GLU,ResNum=34)                0     16.243176     20.429564     40.991865  L
 C-CT-0.039700(PDBName=CA,ResName=GLU,ResNum=34)              0     15.516390     20.186586     38.964186  L
 H-H1-0.110500(PDBName=HA,ResName=GLU,ResNum=34)              0     16.250480     20.216389     38.161797  L
 C-CT-0.056000(PDBName=CB,ResName=GLU,ResNum=34)              0     15.232264     18.706528     39.283371  L
 H-HC--0.017300(PDBName=2HB,ResName=GLU,ResNum=34)            0     14.372317     18.637734     39.952330  L
 H-HC--0.017300(PDBName=3HB,ResName=GLU,ResNum=34)            0     14.952327     18.222092     38.346852  L
 C-CT-0.013600(PDBName=CG,ResName=GLU,ResNum=34)              0     16.403356     17.915105     39.883700  L
 H-HC--0.042500(PDBName=2HG,ResName=GLU,ResNum=34)            0     16.256304     16.855923     39.661907  L
 H-HC--0.042500(PDBName=3HG,ResName=GLU,ResNum=34)            0     17.340907     18.231429     39.421024  L
 C-C-0.805400(PDBName=CD,ResName=GLU,ResNum=34)               0     16.450399     18.096073     41.400841  L
 O-O2--0.818800(PDBName=OE1,ResName=GLU,ResNum=34)            0     17.224926     18.941400     41.888126  L
 O-O2--0.818800(PDBName=OE2,ResName=GLU,ResNum=34)            0     15.608725     17.503311     42.117137  L
 C-C-0.536600(PDBName=C,ResName=GLU,ResNum=34)                0     14.209619     20.834958     38.460296  L
 O-O--0.581900(PDBName=O,ResName=GLU,ResNum=34)               0     13.413464     21.314302     39.269226  L
 N-N--0.516300(PDBName=N,ResName=GLU,ResNum=35)               0     13.958872     20.832901     37.142950  L
 H-H-0.293600(PDBName=H,ResName=GLU,ResNum=35)                0     14.666596     20.440132     36.539844  L
 C-CT-0.039700(PDBName=CA,ResName=GLU,ResNum=35)              0     12.671000     21.250691     36.552672  L
 H-H1-0.110500(PDBName=HA,ResName=GLU,ResNum=35)              0     12.506217     22.291362     36.802737  L
 C-CT-0.056000(PDBName=CB,ResName=GLU,ResNum=35)              0     12.718746     21.210030     35.014311  L
 H-HC--0.017300(PDBName=2HB,ResName=GLU,ResNum=35)            0     13.446989     21.947834     34.680319  L
 H-HC--0.017300(PDBName=3HB,ResName=GLU,ResNum=35)            0     13.075204     20.228562     34.698039  L
 C-CT-0.013600(PDBName=CG,ResName=GLU,ResNum=35)              0     11.386007     21.492083     34.287662  L
 H-HC--0.042500(PDBName=2HG,ResName=GLU,ResNum=35)            0     11.592733     21.564376     33.217630  L
 H-HC--0.042500(PDBName=3HG,ResName=GLU,ResNum=35)            0     10.730475     20.629173     34.422120  L
 C-C-0.805400(PDBName=CD,ResName=GLU,ResNum=35)               0     10.637096     22.759503     34.740125  L
 O-O2--0.818800(PDBName=OE1,ResName=GLU,ResNum=35)            0     10.909743     23.877658     34.252573  L
 O-O2--0.818800(PDBName=OE2,ResName=GLU,ResNum=35)            0      9.691308     22.643824     35.549675  L
 C-C-0.536600(PDBName=C,ResName=GLU,ResNum=35)                0     11.492250     20.455496     37.141837  L
 O-O--0.581900(PDBName=O,ResName=GLU,ResNum=35)               0     11.345555     19.253318     36.927352  L
 N-N--0.415700(PDBName=N,ResName=MET,ResNum=36)               0     10.648760     21.158970     37.896332  L
 H-H-0.271900(PDBName=H,ResName=MET,ResNum=36)                0     10.834956     22.146615     37.982229  L
 C-CT--0.023700(PDBName=CA,ResName=MET,ResNum=36)             0      9.392394     20.685638     38.461568  L
 H-H1-0.088000(PDBName=HA,ResName=MET,ResNum=36)              0      9.016921     19.878677     37.830918  L
 C-CT-0.034200(PDBName=CB,ResName=MET,ResNum=36)              0      9.618791     20.116168     39.875650  L
 H-HC-0.024100(PDBName=2HB,ResName=MET,ResNum=36)             0      8.659489     19.803773     40.289501  L
 H-HC-0.024100(PDBName=3HB,ResName=MET,ResNum=36)             0     10.252411     19.232122     39.789748  L
 C-CT-0.001800(PDBName=CG,ResName=MET,ResNum=36)              0     10.287962     21.091745     40.853717  L
 H-H1-0.044000(PDBName=2HG,ResName=MET,ResNum=36)             0     11.223898     21.436359     40.418195  L
 H-H1-0.044000(PDBName=3HG,ResName=MET,ResNum=36)             0      9.646528     21.959029     40.992573  L
 S-S--0.273700(PDBName=SD,ResName=MET,ResNum=36)              0     10.655477     20.399677     42.487305  L
 C-CT--0.053600(PDBName=CE,ResName=MET,ResNum=36)             0     11.673044     21.762028     43.108638  L
 H-H1-0.068400(PDBName=1HE,ResName=MET,ResNum=36)             0     12.533520     21.901752     42.452478  L
 H-H1-0.068400(PDBName=2HE,ResName=MET,ResNum=36)             0     11.084629     22.679066     43.121960  L
 H-H1-0.068400(PDBName=3HE,ResName=MET,ResNum=36)             0     12.019040     21.539045     44.117778  L
 C-C-0.597300(PDBName=C,ResName=MET,ResNum=36)                0      8.371401     21.829845     38.435962  L
 O-O--0.567900(PDBName=O,ResName=MET,ResNum=36)               0      8.629820     22.929977     38.930855  L
 N-N--0.415700(PDBName=N,ResName=ASN,ResNum=37)               0      7.196420     21.583137     37.851564  L
 H-H-0.271900(PDBName=H,ResName=ASN,ResNum=37)                0      7.071322     20.675403     37.432386  L
 C-CT-0.014300(PDBName=CA,ResName=ASN,ResNum=37)              0      6.166905     22.603528     37.656701  L
 H-H1-0.104800(PDBName=HA,ResName=ASN,ResNum=37)              0      6.667070     23.523923     37.348943  L
 C-CT--0.204100(PDBName=CB,ResName=ASN,ResNum=37)             0      5.258180     22.169525     36.493533  L
 H-HC-0.079700(PDBName=2HB,ResName=ASN,ResNum=37)             0      5.873512     21.837471     35.657441  L
 H-HC-0.079700(PDBName=3HB,ResName=ASN,ResNum=37)             0      4.621917     21.338461     36.798613  L
 C-C-0.713000(PDBName=CG,ResName=ASN,ResNum=37)               0      4.394619     23.316524     36.005631  L
 O-O--0.593100(PDBName=OD1,ResName=ASN,ResNum=37)             0      4.714724     23.983901     35.031720  L
 N-N--0.919100(PDBName=ND2,ResName=ASN,ResNum=37)             0      3.307352     23.601156     36.678599  L
 H-H-0.419600(PDBName=1HD2,ResName=ASN,ResNum=37)             0      2.735680     24.352829     36.344458  L
 H-H-0.419600(PDBName=2HD2,ResName=ASN,ResNum=37)             0      3.133295     23.107839     37.547513  L
 C-C-0.597300(PDBName=C,ResName=ASN,ResNum=37)                0      5.401259     22.916209     38.963926  L
 O-O--0.567900(PDBName=O,ResName=ASN,ResNum=37)               0      4.264571     22.483976     39.161368  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=38)               0      6.029102     23.696193     39.845411  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=38)                0      6.983906     23.936275     39.599006  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=38)             0      5.490923     24.185131     41.119259  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=38)              0      5.261946     23.317008     41.735807  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=38)             0      6.579897     25.033918     41.808523  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=38)             0      6.888825     25.809609     41.111619  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=38)             0      6.157205     25.539664     42.677211  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=38)              0      7.830556     24.255356     42.255015  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=38)             0      8.157120     23.586892     41.463230  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=38)            0      8.963504     25.239632     42.542531  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=38)            0      9.272313     25.714121     41.611612  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=38)            0      8.624989     26.008460     43.234680  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=38)            0      9.821530     24.713794     42.959125  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=38)            0      7.555506     23.429421     43.512611  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=38)            0      7.227599     24.074585     44.327031  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=38)            0      6.787109     22.685334     43.309566  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=38)            0      8.463648     22.905870     43.811215  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=38)                0      4.193549     25.017339     40.956579  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=38)               0      3.958149     25.614879     39.899554  L
 N-N--0.254800(PDBName=N,ResName=PRO,ResNum=39)               0      3.355088     25.117859     42.005445  L
 C-CT-0.019200(PDBName=CD,ResName=PRO,ResNum=39)              0      3.423425     24.356366     43.248325  L
 H-H1-0.039100(PDBName=2HD,ResName=PRO,ResNum=39)             0      4.390627     24.470468     43.738527  L
 H-H1-0.039100(PDBName=3HD,ResName=PRO,ResNum=39)             0      3.232559     23.303403     43.035419  L
 C-CT-0.018900(PDBName=CG,ResName=PRO,ResNum=39)              0      2.315550     24.903721     44.148660  L
 H-HC-0.021300(PDBName=2HG,ResName=PRO,ResNum=39)             0      2.715080     25.694750     44.784364  L
 H-HC-0.021300(PDBName=3HG,ResName=PRO,ResNum=39)             0      1.866676     24.118545     44.757891  L
 C-CT--0.007000(PDBName=CB,ResName=PRO,ResNum=39)             0      1.313170     25.491267     43.153622  L
 H-HC-0.025300(PDBName=2HB,ResName=PRO,ResNum=39)             0      0.710802     26.282253     43.602957  L
 H-HC-0.025300(PDBName=3HB,ResName=PRO,ResNum=39)             0      0.668099     24.694317     42.780027  L
 C-CT--0.026600(PDBName=CA,ResName=PRO,ResNum=39)             0      2.195638     26.006360     42.009411  L
 H-H1-0.064100(PDBName=HA,ResName=PRO,ResNum=39)              0      1.645663     25.915160     41.071966  L
 C-C-0.589600(PDBName=C,ResName=PRO,ResNum=39)                0      2.614892     27.475757     42.207949  L
 O-O--0.574800(PDBName=O,ResName=PRO,ResNum=39)               0      3.000469     27.876051     43.305246  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=40)               0      2.515742     28.297950     41.157120  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=40)                0      2.294650     27.893771     40.258091  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=40)             0      2.623553     29.760346     41.253396  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=40)             0      1.619692     30.168383     41.369578  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=40)             0      3.191328     30.029871     42.141856  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=40)                0      3.269171     30.445814     40.044527  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=40)               0      3.346295     29.883013     38.952843  L
 N-N--0.347900(PDBName=N,ResName=LYS,ResNum=41)               0      3.706186     31.697353     40.241805  L
 H-H-0.274700(PDBName=H,ResName=LYS,ResNum=41)                0      3.648588     32.044616     41.187348  L
 C-CT--0.240000(PDBName=CA,ResName=LYS,ResNum=41)             0      4.336842     32.547265     39.215127  L
 H-H1-0.142600(PDBName=HA,ResName=LYS,ResNum=41)              0      3.677196     32.604619     38.347581  L
 C-CT--0.009400(PDBName=CB,ResName=LYS,ResNum=41)             0      4.588318     33.960137     39.772105  L
 H-HC-0.036200(PDBName=2HB,ResName=LYS,ResNum=41)             0      5.201178     33.871606     40.666364  L
 H-HC-0.036200(PDBName=3HB,ResName=LYS,ResNum=41)             0      5.150630     34.523233     39.024640  L
 C-CT-0.018700(PDBName=CG,ResName=LYS,ResNum=41)              0      3.317041     34.748827     40.113263  L
 H-HC-0.010300(PDBName=2HG,ResName=LYS,ResNum=41)             0      2.627234     34.657649     39.272875  L
 H-HC-0.010300(PDBName=3HG,ResName=LYS,ResNum=41)             0      2.837900     34.321493     40.995230  L
 C-CT--0.047900(PDBName=CD,ResName=LYS,ResNum=41)             0      3.581098     36.250428     40.341773  L
 H-HC-0.062100(PDBName=2HD,ResName=LYS,ResNum=41)             0      4.189171     36.648600     39.527341  L
 H-HC-0.062100(PDBName=3HD,ResName=LYS,ResNum=41)             0      2.612462     36.750694     40.284929  L
 C-CT--0.014300(PDBName=CE,ResName=LYS,ResNum=41)             0      4.199513     36.640450     41.697151  L
 H-HP-0.113500(PDBName=2HE,ResName=LYS,ResNum=41)             0      4.071363     37.720336     41.815430  L
 H-HP-0.113500(PDBName=3HE,ResName=LYS,ResNum=41)             0      3.635636     36.154823     42.499739  L
 N-N3--0.385400(PDBName=NZ,ResName=LYS,ResNum=41)             0      5.643038     36.317446     41.823825  L
 H-H-0.340000(PDBName=1HZ,ResName=LYS,ResNum=41)              0      6.205009     36.587432     41.012672  L
 H-H-0.340000(PDBName=2HZ,ResName=LYS,ResNum=41)              0      6.050776     36.750417     42.638240  L
 H-H-0.340000(PDBName=3HZ,ResName=LYS,ResNum=41)              0      5.802683     35.317402     41.951326  L
 C-C-0.734100(PDBName=C,ResName=LYS,ResNum=41)                0      5.680746     31.979654     38.749206  L
 O-O--0.589400(PDBName=O,ResName=LYS,ResNum=41)               0      6.479260     31.544732     39.577726  L
 N-N--0.415700(PDBName=N,ResName=TRP,ResNum=42)               0      5.980295     32.102678     37.455687  L
 H-H-0.271900(PDBName=H,ResName=TRP,ResNum=42)                0      5.288869     32.460907     36.813850  L
 C-CT--0.027500(PDBName=CA,ResName=TRP,ResNum=42)             0      7.317607     31.856505     36.908472  L
 H-H1-0.112300(PDBName=HA,ResName=TRP,ResNum=42)              0      8.029629     32.136688     37.679742  L
 C-CT--0.005000(PDBName=CB,ResName=TRP,ResNum=42)             0      7.488874     30.356480     36.616972  L
 H-HC-0.033900(PDBName=2HB,ResName=TRP,ResNum=42)             0      8.505658     30.180950     36.270346  L
 H-HC-0.033900(PDBName=3HB,ResName=TRP,ResNum=42)             0      7.382729     29.808118     37.551677  L
 C-C*--0.141500(PDBName=CG,ResName=TRP,ResNum=42)             0      6.543759     29.757188     35.621222  L
 C-CW--0.163800(PDBName=CD1,ResName=TRP,ResNum=42)            0      5.364091     29.168688     35.924416  L
 H-H4-0.206200(PDBName=HD1,ResName=TRP,ResNum=42)             0      4.955574     29.074542     36.926772  L
 N-NA--0.341800(PDBName=NE1,ResName=TRP,ResNum=42)            0      4.761770     28.723163     34.763517  L
 H-H-0.341200(PDBName=HE1,ResName=TRP,ResNum=42)              0      3.853636     28.277849     34.735695  L
 C-CN-0.138000(PDBName=CE2,ResName=TRP,ResNum=42)             0      5.531100     28.997678     33.653136  L
 C-CA--0.260100(PDBName=CZ2,ResName=TRP,ResNum=42)            0      5.365214     28.734183     32.286515  L
 H-HA-0.157200(PDBName=HZ2,ResName=TRP,ResNum=42)             0      4.482557     28.223504     31.929957  L
 C-CA--0.113400(PDBName=CH2,ResName=TRP,ResNum=42)            0      6.365063     29.140002     31.386310  L
 H-HA-0.141700(PDBName=HH2,ResName=TRP,ResNum=42)             0      6.252624     28.941131     30.328400  L
 C-CA--0.197200(PDBName=CZ3,ResName=TRP,ResNum=42)            0      7.511380     29.801968     31.861819  L
 H-HA-0.144700(PDBName=HZ3,ResName=TRP,ResNum=42)             0      8.275959     30.105178     31.160068  L
 C-CA--0.238700(PDBName=CE3,ResName=TRP,ResNum=42)            0      7.664827     30.062444     33.237262  L
 H-HA-0.170000(PDBName=HE3,ResName=TRP,ResNum=42)             0      8.550764     30.560934     33.591711  L
 C-CB-0.124300(PDBName=CD2,ResName=TRP,ResNum=42)             0      6.681044     29.665084     34.169304  L
 C-C-0.597300(PDBName=C,ResName=TRP,ResNum=42)                0      7.637306     32.722587     35.674205  L
 O-O--0.567900(PDBName=O,ResName=TRP,ResNum=42)               0      6.752109     33.374873     35.123934  L
 N-N--0.347900(PDBName=N,ResName=LYS,ResNum=43)               0      8.912184     32.754343     35.258382  L
 H-H-0.274700(PDBName=H,ResName=LYS,ResNum=43)                0      9.573761     32.249803     35.845904  L
 C-CT--0.240000(PDBName=CA,ResName=LYS,ResNum=43)             0      9.433978     33.335985     34.000461  L
 H-H1-0.142600(PDBName=HA,ResName=LYS,ResNum=43)              0      8.692187     33.164131     33.218360  L
 C-CT--0.009400(PDBName=CB,ResName=LYS,ResNum=43)             0      9.623134     34.863931     34.154140  L
 H-HC-0.036200(PDBName=2HB,ResName=LYS,ResNum=43)             0      9.980287     35.262327     33.205420  L
 H-HC-0.036200(PDBName=3HB,ResName=LYS,ResNum=43)             0      8.652707     35.326811     34.339358  L
 C-CT-0.018700(PDBName=CG,ResName=LYS,ResNum=43)              0     10.624878     35.301520     35.240618  L
 H-HC-0.010300(PDBName=2HG,ResName=LYS,ResNum=43)             0     11.317817     34.489331     35.446139  L
 H-HC-0.010300(PDBName=3HG,ResName=LYS,ResNum=43)             0     11.220370     36.130255     34.854320  L
 C-CT--0.047900(PDBName=CD,ResName=LYS,ResNum=43)             0      9.977623     35.745647     36.561659  L
 H-HC-0.062100(PDBName=2HD,ResName=LYS,ResNum=43)             0      9.192688     35.047396     36.854905  L
 H-HC-0.062100(PDBName=3HD,ResName=LYS,ResNum=43)             0     10.754082     35.727603     37.325313  L
 C-CT--0.014300(PDBName=CE,ResName=LYS,ResNum=43)             0      9.419997     37.174389     36.456478  L
 H-HP-0.113500(PDBName=2HE,ResName=LYS,ResNum=43)             0     10.205160     37.809730     36.036637  L
 H-HP-0.113500(PDBName=3HE,ResName=LYS,ResNum=43)             0      8.572105     37.181750     35.765377  L
 N-N3--0.385400(PDBName=NZ,ResName=LYS,ResNum=43)             0      9.017033     37.708376     37.781712  L
 H-H-0.340000(PDBName=1HZ,ResName=LYS,ResNum=43)              0      9.712495     37.471362     38.494419  L
 H-H-0.340000(PDBName=2HZ,ResName=LYS,ResNum=43)              0      8.860335     38.704081     37.778951  L
 H-H-0.340000(PDBName=3HZ,ResName=LYS,ResNum=43)              0      8.197875     37.238505     38.161515  L
 C-C-0.734100(PDBName=C,ResName=LYS,ResNum=43)                0     10.744720     32.634926     33.564939  L
 O-O--0.589400(PDBName=O,ResName=LYS,ResNum=43)               0     11.387097     32.016605     34.412300  L
 N-N--0.254800(PDBName=N,ResName=PRO,ResNum=44)               0     11.174330     32.680570     32.289747  L
 C-CT-0.019200(PDBName=CD,ResName=PRO,ResNum=44)              0     10.452482     33.210267     31.140460  L
 H-H1-0.039100(PDBName=2HD,ResName=PRO,ResNum=44)             0     10.070443     34.214056     31.318804  L
 H-H1-0.039100(PDBName=3HD,ResName=PRO,ResNum=44)             0      9.631498     32.537146     30.888472  L
 C-CT-0.018900(PDBName=CG,ResName=PRO,ResNum=44)              0     11.464048     33.238800     29.994880  L
 H-HC-0.021300(PDBName=2HG,ResName=PRO,ResNum=44)             0     12.006709     34.185547     30.009808  L
 H-HC-0.021300(PDBName=3HG,ResName=PRO,ResNum=44)             0     10.983755     33.087653     29.027571  L
 C-CT--0.007000(PDBName=CB,ResName=PRO,ResNum=44)             0     12.416479     32.095043     30.342359  L
 H-HC-0.025300(PDBName=2HB,ResName=PRO,ResNum=44)             0     13.397184     32.230673     29.883967  L
 H-HC-0.025300(PDBName=3HB,ResName=PRO,ResNum=44)             0     11.977635     31.148512     30.022331  L
 C-CT--0.026600(PDBName=CA,ResName=PRO,ResNum=44)             0     12.476180     32.135421     31.872579  L
 H-H1-0.064100(PDBName=HA,ResName=PRO,ResNum=44)              0     12.593147     31.118532     32.248445  L
 C-C-0.589600(PDBName=C,ResName=PRO,ResNum=44)                0     13.661910     32.986214     32.375047  L
 O-O--0.574800(PDBName=O,ResName=PRO,ResNum=44)               0     13.529337     34.196805     32.551969  L
 N-N--0.347900(PDBName=N,ResName=LYS,ResNum=45)               0     14.824205     32.355036     32.601151  L
 H-H-0.274700(PDBName=H,ResName=LYS,ResNum=45)                0     14.835402     31.347295     32.450730  L
 C-CT--0.240000(PDBName=CA,ResName=LYS,ResNum=45)             0     16.095636     32.968579     33.043652  L
 H-H1-0.142600(PDBName=HA,ResName=LYS,ResNum=45)              0     16.196562     33.935296     32.547365  L
 C-CT--0.009400(PDBName=CB,ResName=LYS,ResNum=45)             0     15.985343     33.222165     34.569238  L
 H-HC-0.036200(PDBName=2HB,ResName=LYS,ResNum=45)             0     15.167430     33.930618     34.715017  L
 H-HC-0.036200(PDBName=3HB,ResName=LYS,ResNum=45)             0     15.691137     32.297878     35.066909  L
 C-CT-0.018700(PDBName=CG,ResName=LYS,ResNum=45)              0     17.224111     33.787931     35.295078  L
 H-HC-0.010300(PDBName=2HG,ResName=LYS,ResNum=45)             0     17.941110     32.980250     35.449350  L
 H-HC-0.010300(PDBName=3HG,ResName=LYS,ResNum=45)             0     17.684992     34.575419     34.697320  L
 C-CT--0.047900(PDBName=CD,ResName=LYS,ResNum=45)             0     16.826330     34.371051     36.657572  L
 H-HC-0.062100(PDBName=2HD,ResName=LYS,ResNum=45)             0     16.366266     35.349663     36.509012  L
 H-HC-0.062100(PDBName=3HD,ResName=LYS,ResNum=45)             0     16.085842     33.709792     37.098350  L
 C-CT--0.014300(PDBName=CE,ResName=LYS,ResNum=45)             0     18.004942     34.488185     37.634735  L
 H-HP-0.113500(PDBName=2HE,ResName=LYS,ResNum=45)             0     18.441253     33.494706     37.774706  L
 H-HP-0.113500(PDBName=3HE,ResName=LYS,ResNum=45)             0     18.783044     35.129839     37.211968  L
 N-N3--0.385400(PDBName=NZ,ResName=LYS,ResNum=45)             0     17.571265     35.009363     38.956499  L
 H-H-0.340000(PDBName=1HZ,ResName=LYS,ResNum=45)              0     18.273987     34.768684     39.669254  L
 H-H-0.340000(PDBName=2HZ,ResName=LYS,ResNum=45)              0     17.465401     36.008806     38.957286  L
 H-H-0.340000(PDBName=3HZ,ResName=LYS,ResNum=45)              0     16.692810     34.597007     39.255120  L
 C-C-0.734100(PDBName=C,ResName=LYS,ResNum=45)                0     17.310574     32.116789     32.605097  L
 O-O--0.589400(PDBName=O,ResName=LYS,ResNum=45)               0     17.163548     31.039216     32.028516  L
 N-N--0.415700(PDBName=N,ResName=MET,ResNum=46)               0     18.522193     32.609727     32.850268  L
 H-H-0.271900(PDBName=H,ResName=MET,ResNum=46)                0     18.580810     33.493126     33.335211  L
 C-CT--0.023700(PDBName=CA,ResName=MET,ResNum=46)             0     19.816761     31.971872     32.579514  L
 H-H1-0.088000(PDBName=HA,ResName=MET,ResNum=46)              0     19.691122     30.890538     32.533963  L
 C-CT-0.034200(PDBName=CB,ResName=MET,ResNum=46)              0     20.311918     32.480181     31.212247  L
 H-HC-0.024100(PDBName=2HB,ResName=MET,ResNum=46)             0     19.580387     32.172903     30.463518  L
 H-HC-0.024100(PDBName=3HB,ResName=MET,ResNum=46)             0     20.336754     33.571331     31.219598  L
 C-CT-0.001800(PDBName=CG,ResName=MET,ResNum=46)              0     21.682295     31.971496     30.747377  L
 H-H1-0.044000(PDBName=2HG,ResName=MET,ResNum=46)             0     21.771383     30.904936     30.950426  L
 H-H1-0.044000(PDBName=3HG,ResName=MET,ResNum=46)             0     21.724316     32.107802     29.666616  L
 S-S--0.273700(PDBName=SD,ResName=MET,ResNum=46)              0     23.109620     32.841356     31.452298  L
 C-CT--0.053600(PDBName=CE,ResName=MET,ResNum=46)             0     24.370317     32.429000     30.217600  L
 H-H1-0.068400(PDBName=1HE,ResName=MET,ResNum=46)             0     25.322806     32.873204     30.508482  L
 H-H1-0.068400(PDBName=2HE,ResName=MET,ResNum=46)             0     24.482211     31.347816     30.151149  L
 H-H1-0.068400(PDBName=3HE,ResName=MET,ResNum=46)             0     24.076958     32.825192     29.245624  L
 C-C-0.597300(PDBName=C,ResName=MET,ResNum=46)                0     20.780416     32.302998     33.731043  L
 O-O--0.567900(PDBName=O,ResName=MET,ResNum=46)               0     20.697692     33.401078     34.282697  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=47)               0     21.639114     31.354927     34.121710  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=47)                0     21.658612     30.490766     33.587574  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=47)             0     22.689835     31.516555     35.148694  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=47)              0     22.994128     32.563932     35.167093  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=47)              0     22.188090     31.130069     36.564463  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=47)              0     23.052184     31.134614     37.230605  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=47)            0     21.215636     32.178745     37.127043  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=47)            0     21.057402     32.006283     38.191610  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=47)            0     21.635214     33.178249     37.007684  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=47)            0     20.260043     32.131235     36.607139  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=47)            0     21.570451     29.715402     36.598275  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=47)            0     20.524414     29.759181     36.293459  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=47)            0     22.096698     29.075887     35.894264  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=47)            0     21.680583     29.053344     37.974458  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=47)            0     21.365940     29.739889     38.756920  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=47)            0     21.050120     28.167156     38.008552  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=47)            0     22.714669     28.759414     38.151722  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=47)                0     23.948485     30.699605     34.802301  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=47)               0     23.925334     29.870491     33.890987  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=48)               0     25.034388     30.903679     35.557568  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=48)                0     24.978054     31.568150     36.314004  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=48)             0     26.285890     30.149052     35.443874  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=48)             0     26.067702     29.164005     35.035730  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=48)             0     26.965112     30.661585     34.764236  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=48)                0     27.015382     29.932394     36.772232  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=48)               0     26.722995     30.588470     37.779765  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=49)               0     27.960763     28.995219     36.753682  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=49)                0     28.160539     28.584301     35.844015  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=49)             0     28.649051     28.414931     37.907279  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=49)             0     28.503943     29.025758     38.793627  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=49)             0     28.197700     27.445281     38.095651  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=49)                0     30.153710     28.217471     37.684752  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=49)               0     30.797551     29.017514     37.008003  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=50)               0     30.709985     27.157108     38.274709  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=50)                0     30.102301     26.588887     38.856249  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=50)             0     32.059253     26.635102     38.009792  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=50)              0     32.644312     27.440258     37.574180  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=50)              0     32.790547     26.218495     39.309361  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=50)              0     32.950261     27.129968     39.886806  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=50)            0     31.983916     25.252281     40.193354  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=50)            0     31.766054     24.323506     39.664767  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=50)            0     32.542181     25.018656     41.098631  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=50)            0     31.054709     25.713942     40.517755  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=50)            0     34.175823     25.623587     38.973435  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=50)            0     34.061502     24.590255     38.642374  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=50)            0     34.618931     26.193572     38.157538  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=50)            0     35.164534     25.661767     40.138495  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=50)            0     34.798820     25.054217     40.964667  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=50)            0     36.127809     25.270398     39.810680  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=50)            0     35.296556     26.691653     40.466909  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=50)                0     32.031215     25.534825     36.940842  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=50)               0     32.966151     25.433312     36.151628  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=51)               0     30.940148     24.763585     36.862620  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=51)                0     30.235356     24.899533     37.575071  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=51)             0     30.683052     23.859628     35.738276  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=51)             0     31.492077     23.131126     35.675264  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=51)             0     29.748762     23.325102     35.896612  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=51)                0     30.596372     24.604688     34.400304  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=51)               0     31.344253     24.313652     33.471210  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=52)               0     29.654285     25.542017     34.284004  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=52)                0     29.014222     25.682325     35.056479  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=52)             0     29.467754     26.374736     33.096634  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=52)             0     30.322220     27.045003     33.002197  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=52)             0     29.431367     25.748742     32.205877  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=52)                0     28.203673     27.229450     33.185420  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=52)               0     28.137445     28.136951     34.013572  L
 N-N--0.415700(PDBName=N,ResName=PHE,ResNum=53)               0     27.209961     26.967056     32.329433  L
 H-H-0.271900(PDBName=H,ResName=PHE,ResNum=53)                0     27.305053     26.144550     31.742790  L
 C-CT--0.002400(PDBName=CA,ResName=PHE,ResNum=53)             0     25.991115     27.781073     32.196612  L
 H-H1-0.097800(PDBName=HA,ResName=PHE,ResNum=53)              0     25.818065     28.318398     33.125671  L
 C-CT--0.034300(PDBName=CB,ResName=PHE,ResNum=53)             0     26.175305     28.811021     31.071604  L
 H-HC-0.029500(PDBName=2HB,ResName=PHE,ResNum=53)             0     26.453856     28.290688     30.153672  L
 H-HC-0.029500(PDBName=3HB,ResName=PHE,ResNum=53)             0     25.215213     29.293973     30.888916  L
 C-CA-0.011800(PDBName=CG,ResName=PHE,ResNum=53)              0     27.194267     29.896451     31.362442  L
 C-CA--0.125600(PDBName=CD1,ResName=PHE,ResNum=53)            0     28.521310     29.768763     30.909956  L
 H-HA-0.133000(PDBName=HD1,ResName=PHE,ResNum=53)             0     28.825198     28.891166     30.357665  L
 C-CA--0.170400(PDBName=CE1,ResName=PHE,ResNum=53)            0     29.461936     30.776178     31.189445  L
 H-HA-0.143000(PDBName=HE1,ResName=PHE,ResNum=53)             0     30.483666     30.670552     30.851849  L
 C-CA--0.107200(PDBName=CZ,ResName=PHE,ResNum=53)             0     29.077308     31.917221     31.915217  L
 H-HA-0.129700(PDBName=HZ,ResName=PHE,ResNum=53)              0     29.804145     32.688082     32.130961  L
 C-CA--0.170400(PDBName=CE2,ResName=PHE,ResNum=53)            0     27.751735     32.050524     32.364015  L
 H-HA-0.143000(PDBName=HE2,ResName=PHE,ResNum=53)             0     27.457702     32.926769     32.923685  L
 C-CA--0.125600(PDBName=CD2,ResName=PHE,ResNum=53)            0     26.813743     31.039190     32.090495  L
 H-HA-0.133000(PDBName=HD2,ResName=PHE,ResNum=53)             0     25.798828     31.138576     32.446372  L
 C-C-0.597300(PDBName=C,ResName=PHE,ResNum=53)                0     24.738193     26.941251     31.915955  L
 O-O--0.567900(PDBName=O,ResName=PHE,ResNum=53)               0     24.801212     25.940855     31.203120  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=54)               0     23.578368     27.378803     32.422292  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=54)                0     23.601479     28.235681     32.969609  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=54)             0     22.276378     26.727739     32.196507  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=54)              0     22.376612     26.082029     31.323487  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=54)              0     21.860890     25.815837     33.376913  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=54)              0     20.902238     25.367194     33.111524  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=54)            0     22.862714     24.668562     33.567242  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=54)            0     22.459210     23.924858     34.253991  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=54)            0     23.069299     24.184002     32.612713  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=54)            0     23.788810     25.058095     33.986167  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=54)            0     21.675552     26.592303     34.695059  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=54)            0     22.642659     26.938318     35.060620  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=54)            0     21.051513     27.464357     34.515393  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=54)            0     20.992627     25.762056     35.784916  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=54)            0     20.704700     26.416627     36.602578  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=54)            0     20.100664     25.276141     35.391376  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=54)            0     21.671122     25.003677     36.165343  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=54)                0     21.158446     27.726958     31.864277  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=54)               0     21.135086     28.866562     32.334038  L
 N-N--0.347900(PDBName=N,ResName=LYS,ResNum=55)               0     20.194314     27.263459     31.062003  L
 H-H-0.274700(PDBName=H,ResName=LYS,ResNum=55)                0     20.287516     26.292223     30.801796  L
 C-CT--0.240000(PDBName=CA,ResName=LYS,ResNum=55)             0     18.880614     27.889416     30.839486  L
 H-H1-0.142600(PDBName=HA,ResName=LYS,ResNum=55)              0     18.944739     28.968039     30.996894  L
 C-CT--0.009400(PDBName=CB,ResName=LYS,ResNum=55)             0     18.397719     27.599192     29.406548  L
 H-HC-0.036200(PDBName=2HB,ResName=LYS,ResNum=55)             0     18.325006     26.517918     29.271303  L
 H-HC-0.036200(PDBName=3HB,ResName=LYS,ResNum=55)             0     17.400316     28.024752     29.280711  L
 C-CT-0.018700(PDBName=CG,ResName=LYS,ResNum=55)              0     19.325580     28.183033     28.325553  L
 H-HC-0.010300(PDBName=2HG,ResName=LYS,ResNum=55)             0     19.345334     29.270258     28.416869  L
 H-HC-0.010300(PDBName=3HG,ResName=LYS,ResNum=55)             0     20.337611     27.801282     28.466786  L
 C-CT--0.047900(PDBName=CD,ResName=LYS,ResNum=55)             0     18.851526     27.793844     26.916843  L
 H-HC-0.062100(PDBName=2HD,ResName=LYS,ResNum=55)             0     18.789513     26.705305     26.853520  L
 H-HC-0.062100(PDBName=3HD,ResName=LYS,ResNum=55)             0     17.860856     28.218200     26.741141  L
 C-CT--0.014300(PDBName=CE,ResName=LYS,ResNum=55)             0     19.839912     28.313589     25.862367  L
 H-HP-0.113500(PDBName=2HE,ResName=LYS,ResNum=55)             0     19.875753     29.405999     25.925959  L
 H-HP-0.113500(PDBName=3HE,ResName=LYS,ResNum=55)             0     20.837777     27.934083     26.106514  L
 N-N3--0.385400(PDBName=NZ,ResName=LYS,ResNum=55)             0     19.462140     27.891755     24.487823  L
 H-H-0.340000(PDBName=1HZ,ResName=LYS,ResNum=55)              0     18.545972     28.245704     24.242216  L
 H-H-0.340000(PDBName=2HZ,ResName=LYS,ResNum=55)              0     20.130032     28.243410     23.811662  L
 H-H-0.340000(PDBName=3HZ,ResName=LYS,ResNum=55)              0     19.445616     26.881599     24.416363  L
 C-C-0.734100(PDBName=C,ResName=LYS,ResNum=55)                0     17.894080     27.309068     31.858619  L
 O-O--0.589400(PDBName=O,ResName=LYS,ResNum=55)               0     17.915208     26.103117     32.093316  L
 N-N--0.415700(PDBName=N,ResName=VAL,ResNum=56)               0     17.061544     28.150558     32.467084  L
 H-H-0.271900(PDBName=H,ResName=VAL,ResNum=56)                0     17.077530     29.128437     32.194632  L
 C-CT--0.087500(PDBName=CA,ResName=VAL,ResNum=56)             0     16.190627     27.796269     33.603952  L
 H-H1-0.096900(PDBName=HA,ResName=VAL,ResNum=56)              0     15.993474     26.722509     33.590538  L
 C-CT-0.298500(PDBName=CB,ResName=VAL,ResNum=56)              0     16.853799     28.143088     34.957262  L
 H-HC--0.029700(PDBName=HB,ResName=VAL,ResNum=56)             0     16.111360     28.041501     35.748954  L
 C-CT--0.319200(PDBName=CG1,ResName=VAL,ResNum=56)            0     17.997929     27.193042     35.296628  L
 H-HC-0.079100(PDBName=1HG1,ResName=VAL,ResNum=56)            0     17.624870     26.171825     35.344091  L
 H-HC-0.079100(PDBName=2HG1,ResName=VAL,ResNum=56)            0     18.773607     27.255367     34.537561  L
 H-HC-0.079100(PDBName=3HG1,ResName=VAL,ResNum=56)            0     18.420541     27.450196     36.268100  L
 C-CT--0.319200(PDBName=CG2,ResName=VAL,ResNum=56)            0     17.393595     29.577577     35.001582  L
 H-HC-0.079100(PDBName=1HG2,ResName=VAL,ResNum=56)            0     17.746424     29.801760     36.002277  L
 H-HC-0.079100(PDBName=2HG2,ResName=VAL,ResNum=56)            0     18.224827     29.696754     34.306787  L
 H-HC-0.079100(PDBName=3HG2,ResName=VAL,ResNum=56)            0     16.598406     30.272007     34.747094  L
 C-C-0.597300(PDBName=C,ResName=VAL,ResNum=56)                0     14.834950     28.497742     33.535574  L
 O-O--0.567900(PDBName=O,ResName=VAL,ResNum=56)               0     14.669632     29.527533     32.878347  L
 N-N--0.347900(PDBName=N,ResName=ARG,ResNum=57)               0     13.872637     27.977053     34.292519  L
 H-H-0.274700(PDBName=H,ResName=ARG,ResNum=57)                0     14.083379     27.102657     34.774493  L
 C-CT--0.263700(PDBName=CA,ResName=ARG,ResNum=57)             0     12.589501     28.603160     34.601489  L
 H-H1-0.156000(PDBName=HA,ResName=ARG,ResNum=57)              0     12.406569     29.443038     33.931659  L
 C-CT--0.000700(PDBName=CB,ResName=ARG,ResNum=57)             0     11.506198     27.534896     34.363920  L
 H-HC-0.032700(PDBName=2HB,ResName=ARG,ResNum=57)             0     11.601217     27.154817     33.344878  L
 H-HC-0.032700(PDBName=3HB,ResName=ARG,ResNum=57)             0     11.689556     26.692926     35.030123  L
 C-CT-0.039000(PDBName=CG,ResName=ARG,ResNum=57)              0     10.072612     28.053198     34.542571  L
 H-HC-0.028500(PDBName=2HG,ResName=ARG,ResNum=57)             0     10.097421     29.076387     34.916140  L
 H-HC-0.028500(PDBName=3HG,ResName=ARG,ResNum=57)             0      9.570143     28.056034     33.574909  L
 C-CT-0.048600(PDBName=CD,ResName=ARG,ResNum=57)              0      9.265883     27.201902     35.526567  L
 H-H1-0.068700(PDBName=2HD,ResName=ARG,ResNum=57)             0      9.830644     27.113114     36.453544  L
 H-H1-0.068700(PDBName=3HD,ResName=ARG,ResNum=57)             0      8.344037     27.728250     35.766254  L
 N-N2--0.529500(PDBName=NE,ResName=ARG,ResNum=57)             0      8.959594     25.852755     35.009998  L
 H-H-0.345600(PDBName=HE,ResName=ARG,ResNum=57)               0      9.727209     25.183692     34.873583  L
 C-CA-0.807600(PDBName=CZ,ResName=ARG,ResNum=57)              0      7.763749     25.342140     34.782921  L
 N-N2--0.862700(PDBName=NH1,ResName=ARG,ResNum=57)            0      7.610648     24.079255     34.560070  L
 H-H-0.447800(PDBName=1HH1,ResName=ARG,ResNum=57)             0      8.424227     23.484074     34.753581  L
 H-H-0.447800(PDBName=2HH1,ResName=ARG,ResNum=57)             0      6.690801     23.701838     34.423554  L
 N-N2--0.862700(PDBName=NH2,ResName=ARG,ResNum=57)            0      6.665536     26.039142     34.802710  L
 H-H-0.447800(PDBName=1HH2,ResName=ARG,ResNum=57)             0      6.684025     27.016741     35.020184  L
 H-H-0.447800(PDBName=2HH2,ResName=ARG,ResNum=57)             0      5.798470     25.517640     34.778193  L
 C-C-0.734100(PDBName=C,ResName=ARG,ResNum=57)                0     12.649689     29.124480     36.042596  L
 O-O--0.589400(PDBName=O,ResName=ARG,ResNum=57)               0     12.669254     28.347904     36.989000  L
 N-N--0.415700(PDBName=N,ResName=GLN,ResNum=58)               0     12.724834     30.439623     36.234241  L
 H-H-0.271900(PDBName=H,ResName=GLN,ResNum=58)                0     12.614037     31.031107     35.420277  L
 C-CT--0.003100(PDBName=CA,ResName=GLN,ResNum=58)             0     12.584953     31.060044     37.553604  L
 H-H1-0.085000(PDBName=HA,ResName=GLN,ResNum=58)              0     13.204612     30.524650     38.271586  L
 C-CT--0.003600(PDBName=CB,ResName=GLN,ResNum=58)             0     13.046831     32.532768     37.515055  L
 H-HC-0.017100(PDBName=2HB,ResName=GLN,ResNum=58)             0     14.094359     32.562165     37.222779  L
 H-HC-0.017100(PDBName=3HB,ResName=GLN,ResNum=58)             0     12.473272     33.081599     36.770627  L
 C-CT--0.064500(PDBName=CG,ResName=GLN,ResNum=58)             0     12.875946     33.215598     38.886401  L
 H-HC-0.035200(PDBName=2HG,ResName=GLN,ResNum=58)             0     11.816767     33.279006     39.134314  L
 H-HC-0.035200(PDBName=3HG,ResName=GLN,ResNum=58)             0     13.365162     32.603151     39.643766  L
 C-C-0.695100(PDBName=CD,ResName=GLN,ResNum=58)               0     13.471319     34.619929     38.961153  L
 O-O--0.608600(PDBName=OE1,ResName=GLN,ResNum=58)             0     14.670431     34.822178     38.829568  L
 N-N--0.940700(PDBName=NE2,ResName=GLN,ResNum=58)             0     12.692755     35.650272     39.219696  L
 H-H-0.425100(PDBName=1HE2,ResName=GLN,ResNum=58)             0     13.196553     36.501217     39.381422  L
 H-H-0.425100(PDBName=2HE2,ResName=GLN,ResNum=58)             0     11.709064     35.569710     39.482724  L
 C-C-0.597300(PDBName=C,ResName=GLN,ResNum=58)                0     11.130319     30.952012     38.014401  L
 O-O--0.567900(PDBName=O,ResName=GLN,ResNum=58)               0     10.290256     31.720566     37.550065  L
 N-N--0.415700(PDBName=N,ResName=TYR,ResNum=59)               0     10.839777     30.044602     38.943741  L
 H-H-0.271900(PDBName=H,ResName=TYR,ResNum=59)                0     11.613911     29.480293     39.282894  L
 C-CT--0.001400(PDBName=CA,ResName=TYR,ResNum=59)             0      9.704201     30.180058     39.852427  L
 H-H1-0.087600(PDBName=HA,ResName=TYR,ResNum=59)              0      8.818905     30.423720     39.267014  L
 C-CT--0.015200(PDBName=CB,ResName=TYR,ResNum=59)             0      9.444179     28.861246     40.587497  L
 H-HC-0.029500(PDBName=2HB,ResName=TYR,ResNum=59)             0     10.371636     28.300511     40.699524  L
 H-HC-0.029500(PDBName=3HB,ResName=TYR,ResNum=59)             0      9.064955     29.071888     41.586681  L
 C-CA--0.001100(PDBName=CG,ResName=TYR,ResNum=59)             0      8.416895     28.025746     39.859111  L
 C-CA--0.190600(PDBName=CD1,ResName=TYR,ResNum=59)            0      8.811454     26.946190     39.047700  L
 H-HA-0.169900(PDBName=HD1,ResName=TYR,ResNum=59)             0      9.853826     26.667389     38.986588  L
 C-CA--0.234100(PDBName=CE1,ResName=TYR,ResNum=59)            0      7.847391     26.226789     38.316690  L
 H-HA-0.165600(PDBName=HE1,ResName=TYR,ResNum=59)             0      8.142385     25.378837     37.715333  L
 C-C-0.322600(PDBName=CZ,ResName=TYR,ResNum=59)               0      6.490898     26.607294     38.381963  L
 O-OH--0.557900(PDBName=OH,ResName=TYR,ResNum=59)             0      5.544421     25.910108     37.708761  L
 H-HO-0.399200(PDBName=HH,ResName=TYR,ResNum=59)              0      4.779133     25.834754     38.304240  L
 C-CA--0.234100(PDBName=CE2,ResName=TYR,ResNum=59)            0      6.097064     27.681200     39.204520  L
 H-HA-0.165600(PDBName=HE2,ResName=TYR,ResNum=59)             0      5.054573     27.952879     39.267914  L
 C-CA--0.190600(PDBName=CD2,ResName=TYR,ResNum=59)            0      7.059051     28.382618     39.947905  L
 H-HA-0.169900(PDBName=HD2,ResName=TYR,ResNum=59)             0      6.753565     29.208589     40.572698  L
 C-C-0.597300(PDBName=C,ResName=TYR,ResNum=59)                0      9.941708     31.349162     40.812724  L
 O-O--0.567900(PDBName=O,ResName=TYR,ResNum=59)               0     11.067164     31.639365     41.211123  L
 N-N--0.516300(PDBName=N,ResName=ASP,ResNum=60)               0      8.885554     32.093049     41.113005  L
 H-H-0.293600(PDBName=H,ResName=ASP,ResNum=60)                0      7.989754     31.766842     40.761142  L
 C-CT-0.038100(PDBName=CA,ResName=ASP,ResNum=60)              0      8.992215     33.526418     41.368157  L
 H-H1-0.088000(PDBName=HA,ResName=ASP,ResNum=60)              0     10.031936     33.811022     41.544453  L
 C-CT--0.030300(PDBName=CB,ResName=ASP,ResNum=60)             0      8.526416     34.201063     40.069799  L
 H-HC--0.012200(PDBName=2HB,ResName=ASP,ResNum=60)            0      9.077716     33.769463     39.231878  L
 H-HC--0.012200(PDBName=3HB,ResName=ASP,ResNum=60)            0      7.472028     33.988872     39.903593  L
 C-C-0.799400(PDBName=CG,ResName=ASP,ResNum=60)               0      8.743044     35.701567     40.029246  L
 O-O2--0.801400(PDBName=OD1,ResName=ASP,ResNum=60)            0      7.731050     36.445929     39.988698  L
 O-O2--0.801400(PDBName=OD2,ResName=ASP,ResNum=60)            0      9.901937     36.127425     39.825185  L
 C-C-0.536600(PDBName=C,ResName=ASP,ResNum=60)                0      8.169459     33.915188     42.603210  L
 O-O--0.581900(PDBName=O,ResName=ASP,ResNum=60)               0      6.947738     34.031429     42.520188  L
 N-N--0.415700(PDBName=N,ResName=GLN,ResNum=61)               0      8.839775     34.118232     43.741806  L
 H-H-0.271900(PDBName=H,ResName=GLN,ResNum=61)                0      9.851408     34.074692     43.681018  L
 C-CT--0.003100(PDBName=CA,ResName=GLN,ResNum=61)             0      8.270006     34.272160     45.091132  L
 H-H1-0.085000(PDBName=HA,ResName=GLN,ResNum=61)              0      9.070185     34.044745     45.795738  L
 C-CT--0.003600(PDBName=CB,ResName=GLN,ResNum=61)             0      7.846176     35.737717     45.339739  L
 H-HC-0.017100(PDBName=2HB,ResName=GLN,ResNum=61)             0      7.137787     36.043091     44.569189  L
 H-HC-0.017100(PDBName=3HB,ResName=GLN,ResNum=61)             0      7.330742     35.797631     46.298159  L
 C-CT--0.064500(PDBName=CG,ResName=GLN,ResNum=61)             0      9.015640     36.739194     45.365979  L
 H-HC-0.035200(PDBName=2HG,ResName=GLN,ResNum=61)             0      9.473471     36.787289     44.377629  L
 H-HC-0.035200(PDBName=3HG,ResName=GLN,ResNum=61)             0      8.632767     37.730454     45.608628  L
 C-C-0.695100(PDBName=CD,ResName=GLN,ResNum=61)               0     10.083635     36.355470     46.385158  L
 O-O--0.608600(PDBName=OE1,ResName=GLN,ResNum=61)             0     11.101923     35.777425     46.043879  L
 N-N--0.940700(PDBName=NE2,ResName=GLN,ResNum=61)             0      9.878275     36.596032     47.657623  L
 H-H-0.425100(PDBName=1HE2,ResName=GLN,ResNum=61)             0     10.543634     36.113476     48.253090  L
 H-H-0.425100(PDBName=2HE2,ResName=GLN,ResNum=61)             0      9.066794     37.054865     48.023635  L
 C-C-0.597300(PDBName=C,ResName=GLN,ResNum=61)                0      7.149335     33.260393     45.424362  L
 O-O--0.567900(PDBName=O,ResName=GLN,ResNum=61)               0      5.961302     33.571401     45.339008  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=62)               0      7.550481     32.063490     45.865277  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=62)                0      8.551287     31.893001     45.892921  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=62)             0      6.710160     30.902283     46.209363  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=62)              0      5.665081     31.153916     46.039668  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=62)              0      7.095865     29.707260     45.297566  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=62)              0      8.107182     29.399361     45.572001  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=62)            0      6.180823     28.491079     45.530260  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=62)            0      5.136374     28.757497     45.364077  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=62)            0      6.449404     27.687139     44.844547  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=62)            0      6.301816     28.120652     46.547580  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=62)            0      7.143604     30.044462     43.787484  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=62)            0      7.922660     30.785624     43.607206  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=62)            0      7.431929     29.144987     43.243558  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=62)            0      5.830441     30.561174     43.188466  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=62)            0      5.496580     31.458368     43.706504  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=62)            0      5.984969     30.806001     42.139168  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=62)            0      5.066142     29.790559     43.263314  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=62)                0      6.930799     30.530969     47.693609  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=62)               0      8.074690     30.577895     48.139269  L
 N-N--0.254800(PDBName=N,ResName=PRO,ResNum=63)               0      5.905103     30.166098     48.490326  L
 C-CT-0.019200(PDBName=CD,ResName=PRO,ResNum=63)              0      4.489663     30.198192     48.152366  L
 H-H1-0.039100(PDBName=2HD,ResName=PRO,ResNum=63)             0      4.245076     29.346686     47.516770  L
 H-H1-0.039100(PDBName=3HD,ResName=PRO,ResNum=63)             0      4.213657     31.132068     47.661198  L
 C-CT-0.018900(PDBName=CG,ResName=PRO,ResNum=63)              0      3.748201     30.073375     49.482266  L
 H-HC-0.021300(PDBName=2HG,ResName=PRO,ResNum=63)             0      2.777396     29.591571     49.360862  L
 H-HC-0.021300(PDBName=3HG,ResName=PRO,ResNum=63)             0      3.635157     31.060988     49.932560  L
 C-CT--0.007000(PDBName=CB,ResName=PRO,ResNum=63)             0      4.699009     29.230319     50.328174  L
 H-HC-0.025300(PDBName=2HB,ResName=PRO,ResNum=63)             0      4.559632     28.176115     50.079854  L
 H-HC-0.025300(PDBName=3HB,ResName=PRO,ResNum=63)             0      4.544291     29.394203     51.395229  L
 C-CT--0.026600(PDBName=CA,ResName=PRO,ResNum=63)             0      6.084340     29.705993     49.876843  L
 H-H1-0.064100(PDBName=HA,ResName=PRO,ResNum=63)              0      6.380580     30.560085     50.483258  L
 C-C-0.589600(PDBName=C,ResName=PRO,ResNum=63)                0      7.135605     28.593229     50.038484  L
 O-O--0.574800(PDBName=O,ResName=PRO,ResNum=63)               0      7.125058     27.621241     49.281980  L
 N-N--0.415700(PDBName=N,ResName=VAL,ResNum=64)               0      8.032002     28.720315     51.022382  L
 H-H-0.271900(PDBName=H,ResName=VAL,ResNum=64)                0      8.000145     29.556672     51.600107  L
 C-CT--0.087500(PDBName=CA,ResName=VAL,ResNum=64)             0      9.172416     27.818205     51.269466  L
 H-H1-0.096900(PDBName=HA,ResName=VAL,ResNum=64)              0      8.965014     26.871236     50.779693  L
 C-CT-0.298500(PDBName=CB,ResName=VAL,ResNum=64)              0     10.463858     28.405620     50.643486  L
 H-HC--0.029700(PDBName=HB,ResName=VAL,ResNum=64)             0     10.502587     29.477479     50.840280  L
 C-CT--0.319200(PDBName=CG1,ResName=VAL,ResNum=64)            0     11.773585     27.792219     51.158863  L
 H-HC-0.079100(PDBName=1HG1,ResName=VAL,ResNum=64)            0     11.762237     26.708453     51.035605  L
 H-HC-0.079100(PDBName=2HG1,ResName=VAL,ResNum=64)            0     12.621005     28.193699     50.607504  L
 H-HC-0.079100(PDBName=3HG1,ResName=VAL,ResNum=64)            0     11.912871     28.043590     52.209692  L
 C-CT--0.319200(PDBName=CG2,ResName=VAL,ResNum=64)            0     10.463610     28.188152     49.125999  L
 H-HC-0.079100(PDBName=1HG2,ResName=VAL,ResNum=64)            0     11.359164     28.616547     48.682842  L
 H-HC-0.079100(PDBName=2HG2,ResName=VAL,ResNum=64)            0     10.437117     27.121468     48.913767  L
 H-HC-0.079100(PDBName=3HG2,ResName=VAL,ResNum=64)            0      9.594879     28.657427     48.674038  L
 C-C-0.597300(PDBName=C,ResName=VAL,ResNum=64)                0      9.351355     27.509000     52.763187  L
 O-O--0.567900(PDBName=O,ResName=VAL,ResNum=64)               0      9.088495     28.337362     53.634121  L
 N-N--0.516300(PDBName=N,ResName=GLU,ResNum=65)               0      9.850140     26.308191     53.055328  L
 H-H-0.293600(PDBName=H,ResName=GLU,ResNum=65)                0     10.079701     25.712903     52.265478  L
 C-CT-0.039700(PDBName=CA,ResName=GLU,ResNum=65)              0     10.313953     25.853506     54.373753  L
 H-H1-0.110500(PDBName=HA,ResName=GLU,ResNum=65)              0     10.342519     26.696996     55.060712  L
 C-CT-0.056000(PDBName=CB,ResName=GLU,ResNum=65)              0      9.328720     24.804172     54.910235  L
 H-HC--0.017300(PDBName=2HB,ResName=GLU,ResNum=65)            0      8.323922     25.230476     54.886321  L
 H-HC--0.017300(PDBName=3HB,ResName=GLU,ResNum=65)            0      9.367552     23.946351     54.251063  L
 C-CT-0.013600(PDBName=CG,ResName=GLU,ResNum=65)              0      9.597880     24.266541     56.317948  L
 H-HC--0.042500(PDBName=2HG,ResName=GLU,ResNum=65)            0     10.503935     23.656393     56.313992  L
 H-HC--0.042500(PDBName=3HG,ResName=GLU,ResNum=65)            0      9.750528     25.104742     56.996379  L
 C-C-0.805400(PDBName=CD,ResName=GLU,ResNum=65)               0      8.406640     23.434040     56.813919  L
 O-O2--0.818800(PDBName=OE1,ResName=GLU,ResNum=65)            0      7.982142     23.680408     57.962618  L
 O-O2--0.818800(PDBName=OE2,ResName=GLU,ResNum=65)            0      7.859873     22.606003     56.047047  L
 C-C-0.536600(PDBName=C,ResName=GLU,ResNum=65)                0     11.729483     25.275520     54.236366  L
 O-O--0.581900(PDBName=O,ResName=GLU,ResNum=65)               0     12.014997     24.593460     53.252425  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=66)               0     12.620523     25.549939     55.192066  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=66)                0     12.307726     26.119230     55.974978  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=66)             0     14.016015     25.079527     55.213437  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=66)              0     14.113041     24.216392     54.557206  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=66)              0     14.996943     26.177309     54.718259  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=66)              0     14.876215     27.058976     55.350862  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=66)            0     16.451134     25.679312     54.841668  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=66)            0     16.596425     24.782955     54.239141  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=66)            0     17.150814     26.448082     54.517558  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=66)            0     16.692675     25.455084     55.879431  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=66)            0     14.716260     26.581184     53.249873  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=66)            0     14.991114     25.761865     52.584872  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=66)            0     13.654245     26.768050     53.123738  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=66)            0     15.427871     27.860202     52.792992  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=66)            0     15.124238     28.696580     53.422792  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=66)            0     16.508551     27.740103     52.837976  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=66)            0     15.146158     28.076324     51.763283  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=66)                0     14.343471     24.623785     56.637642  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=66)               0     14.420128     25.449098     57.544700  L
 N-N--0.415700(PDBName=N,ResName=ALA,ResNum=67)               0     14.492947     23.309307     56.839829  L
 H-H-0.271900(PDBName=H,ResName=ALA,ResNum=67)                0     14.447829     22.700985     56.027121  L
 C-CT-0.033700(PDBName=CA,ResName=ALA,ResNum=67)              0     14.759747     22.647106     58.124595  L
 H-H1-0.082300(PDBName=HA,ResName=ALA,ResNum=67)              0     14.388540     21.624921     58.044072  L
 C-CT--0.182500(PDBName=CB,ResName=ALA,ResNum=67)             0     16.283659     22.552497     58.301161  L
 H-HC-0.060300(PDBName=1HB,ResName=ALA,ResNum=67)             0     16.709123     23.551166     58.400212  L
 H-HC-0.060300(PDBName=2HB,ResName=ALA,ResNum=67)             0     16.515620     21.978483     59.198911  L
 H-HC-0.060300(PDBName=3HB,ResName=ALA,ResNum=67)             0     16.728101     22.054801     57.438375  L
 C-C-0.597300(PDBName=C,ResName=ALA,ResNum=67)                0     14.024082     23.276051     59.338439  L
 O-O--0.567900(PDBName=O,ResName=ALA,ResNum=67)               0     14.616296     23.528274     60.387013  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=68)               0     12.715312     23.527140     59.193255  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=68)                0     12.314124     23.322407     58.291602  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=68)             0     11.857612     24.137629     60.219600  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=68)             0     10.903295     23.611235     60.234816  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=68)             0     12.313397     24.026341     61.204056  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=68)                0     11.573032     25.628561     59.994466  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=68)               0     10.444571     26.078605     60.208699  L
 N-N--0.415700(PDBName=N,ResName=HIE,ResNum=69)               0     12.577612     26.401024     59.576071  L
 H-H-0.271900(PDBName=H,ResName=HIE,ResNum=69)                0     13.446768     25.938478     59.331439  L
 C-CT--0.058100(PDBName=CA,ResName=HIE,ResNum=69)             0     12.459276     27.828573     59.241967  L
 H-H1-0.136000(PDBName=HA,ResName=HIE,ResNum=69)              0     11.928427     28.325623     60.055460  L
 C-CT--0.007400(PDBName=CB,ResName=HIE,ResNum=69)             0     13.873728     28.429143     59.168679  L
 H-HC-0.036700(PDBName=2HB,ResName=HIE,ResNum=69)             0     14.521569     27.891361     59.863030  L
 H-HC-0.036700(PDBName=3HB,ResName=HIE,ResNum=69)             0     14.279982     28.290560     58.165931  L
 C-CC-0.186800(PDBName=CG,ResName=HIE,ResNum=69)              0     13.956322     29.889767     59.540681  L
 N-NB--0.543200(PDBName=ND1,ResName=HIE,ResNum=69)            0     12.969484     30.850812     59.325373  L
 C-CR-0.163500(PDBName=CE1,ResName=HIE,ResNum=69)             0     13.496793     32.021319     59.715757  L
 H-H5-0.143500(PDBName=HE1,ResName=HIE,ResNum=69)             0     13.006241     32.982110     59.621863  L
 N-NA--0.279500(PDBName=NE2,ResName=HIE,ResNum=69)            0     14.742474     31.833832     60.182591  L
 H-H-0.333900(PDBName=HE2,ResName=HIE,ResNum=69)              0     15.415266     32.559124     60.417286  L
 C-CW--0.220700(PDBName=CD2,ResName=HIE,ResNum=69)            0     15.040228     30.494394     60.099167  L
 H-H4-0.186200(PDBName=HD2,ResName=HIE,ResNum=69)             0     15.974251     30.028837     60.379072  L
 C-C-0.597300(PDBName=C,ResName=HIE,ResNum=69)                0     11.635249     28.047795     57.952573  L
 O-O--0.567900(PDBName=O,ResName=HIE,ResNum=69)               0     11.310789     27.091954     57.244802  L
 N-N--0.347900(PDBName=N,ResName=LYS,ResNum=70)               0     11.233738     29.286888     57.653877  L
 H-H-0.274700(PDBName=H,ResName=LYS,ResNum=70)                0     11.645615     30.037856     58.205238  L
 C-CT--0.240000(PDBName=CA,ResName=LYS,ResNum=70)             0     10.204677     29.660918     56.665256  L
 H-H1-0.142600(PDBName=HA,ResName=LYS,ResNum=70)              0     10.008131     28.822439     55.998235  L
 C-CT--0.009400(PDBName=CB,ResName=LYS,ResNum=70)             0      8.906341     30.044964     57.400544  L
 H-HC-0.036200(PDBName=2HB,ResName=LYS,ResNum=70)             0      9.110068     30.929388     58.008088  L
 H-HC-0.036200(PDBName=3HB,ResName=LYS,ResNum=70)             0      8.153640     30.326174     56.661852  L
 C-CT-0.018700(PDBName=CG,ResName=LYS,ResNum=70)              0      8.308107     28.971321     58.327755  L
 H-HC-0.010300(PDBName=2HG,ResName=LYS,ResNum=70)             0      9.047460     28.653020     59.063086  L
 H-HC-0.010300(PDBName=3HG,ResName=LYS,ResNum=70)             0      7.484581     29.436503     58.871652  L
 C-CT--0.047900(PDBName=CD,ResName=LYS,ResNum=70)             0      7.757279     27.747864     57.579993  L
 H-HC-0.062100(PDBName=2HD,ResName=LYS,ResNum=70)             0      7.089010     28.095312     56.790420  L
 H-HC-0.062100(PDBName=3HD,ResName=LYS,ResNum=70)             0      8.568074     27.183111     57.118600  L
 C-CT--0.014300(PDBName=CE,ResName=LYS,ResNum=70)             0      6.949696     26.859567     58.538852  L
 H-HP-0.113500(PDBName=2HE,ResName=LYS,ResNum=70)             0      6.341398     27.505669     59.177366  L
 H-HP-0.113500(PDBName=3HE,ResName=LYS,ResNum=70)             0      6.273039     26.233099     57.949996  L
 N-N3--0.385400(PDBName=NZ,ResName=LYS,ResNum=70)             0      7.804603     25.978596     59.368975  L
 H-H-0.340000(PDBName=1HZ,ResName=LYS,ResNum=70)              0      7.322090     25.634065     60.182798  L
 H-H-0.340000(PDBName=2HZ,ResName=LYS,ResNum=70)              0      8.053563     25.141381     58.833640  L
 H-H-0.340000(PDBName=3HZ,ResName=LYS,ResNum=70)              0      8.684366     26.407172     59.651240  L
 C-C-0.734100(PDBName=C,ResName=LYS,ResNum=70)                0     10.664790     30.843643     55.805423  L
 O-O--0.589400(PDBName=O,ResName=LYS,ResNum=70)               0     11.300694     31.762008     56.310143  L
 N-N--0.415700(PDBName=N,ResName=ALA,ResNum=71)               0     10.320286     30.836305     54.518607  L
 H-H-0.271900(PDBName=H,ResName=ALA,ResNum=71)                0      9.763543     30.059400     54.178174  L
 C-CT-0.033700(PDBName=CA,ResName=ALA,ResNum=71)              0     10.670944     31.889496     53.561398  L
 H-H1-0.082300(PDBName=HA,ResName=ALA,ResNum=71)              0     10.666063     32.856177     54.069303  L
 C-CT--0.182500(PDBName=CB,ResName=ALA,ResNum=71)             0     12.094368     31.603349     53.063487  L
 H-HC-0.060300(PDBName=1HB,ResName=ALA,ResNum=71)             0     12.129071     30.626911     52.581019  L
 H-HC-0.060300(PDBName=2HB,ResName=ALA,ResNum=71)             0     12.405955     32.370245     52.357205  L
 H-HC-0.060300(PDBName=3HB,ResName=ALA,ResNum=71)             0     12.787139     31.613150     53.905127  L
 C-C-0.597300(PDBName=C,ResName=ALA,ResNum=71)                0      9.668271     31.968962     52.390407  L
 O-O--0.567900(PDBName=O,ResName=ALA,ResNum=71)               0      8.749537     31.155152     52.289752  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=72)               0      9.867393     32.917479     51.470013  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=72)                0     10.637836     33.567332     51.617163  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=72)             0      9.146880     33.038149     50.194985  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=72)              0      8.502386     32.169674     50.064200  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=72)              0      8.250172     34.299710     50.165441  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=72)              0      8.905311     35.172699     50.171571  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=72)            0      7.441871     34.330775     48.856724  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=72)            0      6.839189     33.427876     48.756418  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=72)            0      6.787837     35.202892     48.842925  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=72)            0      8.121399     34.390042     48.011332  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=72)            0      7.301506     34.466790     51.377056  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=72)            0      7.891416     34.484947     52.293835  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=72)            0      6.817604     35.441195     51.298214  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=72)            0      6.199671     33.409057     51.530968  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=72)            0      6.637548     32.420337     51.629782  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=72)            0      5.622235     33.623821     52.430420  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=72)            0      5.525777     33.427273     50.674949  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=72)                0     10.190644     33.030193     49.065356  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=72)               0     10.770783     34.054082     48.706271  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=73)               0     10.473268     31.855516     48.510775  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=73)                0      9.853628     31.083329     48.732641  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=73)             0     11.574119     31.626558     47.581473  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=73)             0     12.441674     32.206808     47.897861  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=73)             0     11.846641     30.573712     47.610847  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=73)                0     11.241058     31.966721     46.133939  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=73)               0     10.338849     31.386407     45.532654  L
 N-N--0.415700(PDBName=N,ResName=THR,ResNum=74)               0     12.032954     32.853070     45.539856  L
 H-H-0.271900(PDBName=H,ResName=THR,ResNum=74)                0     12.694968     33.334194     46.132561  L
 C-CT--0.038900(PDBName=CA,ResName=THR,ResNum=74)             0     12.326034     32.809086     44.103300  L
 H-H1-0.100700(PDBName=HA,ResName=THR,ResNum=74)              0     11.424574     32.558697     43.545731  L
 C-CT-0.365400(PDBName=CB,ResName=THR,ResNum=74)              0     12.830129     34.174397     43.628700  L
 H-H1-0.004300(PDBName=HB,ResName=THR,ResNum=74)              0     13.597144     34.552513     44.306125  L
 C-CT--0.243800(PDBName=CG2,ResName=THR,ResNum=74)            0     13.370284     34.174879     42.207575  L
 H-HC-0.064200(PDBName=1HG2,ResName=THR,ResNum=74)            0     14.261319     33.551583     42.133579  L
 H-HC-0.064200(PDBName=2HG2,ResName=THR,ResNum=74)            0     12.595264     33.804117     41.542213  L
 H-HC-0.064200(PDBName=3HG2,ResName=THR,ResNum=74)            0     13.635342     35.194063     41.927403  L
 O-OH--0.676100(PDBName=OG1,ResName=THR,ResNum=74)            0     11.724773     35.044652     43.614749  L
 H-HO-0.410200(PDBName=1HG,ResName=THR,ResNum=74)             0     11.597231     35.339457     44.541967  L
 C-C-0.597300(PDBName=C,ResName=THR,ResNum=74)                0     13.365691     31.715592     43.863875  L
 O-O--0.567900(PDBName=O,ResName=THR,ResNum=74)               0     14.427000     31.722640     44.483174  L
 N-N--0.415700(PDBName=N,ResName=VAL,ResNum=75)               0     13.061381     30.748253     43.001323  L
 H-H-0.271900(PDBName=H,ResName=VAL,ResNum=75)                0     12.210400     30.845803     42.455186  L
 C-CT--0.087500(PDBName=CA,ResName=VAL,ResNum=75)             0     13.863853     29.535497     42.793629  L
 H-H1-0.096900(PDBName=HA,ResName=VAL,ResNum=75)              0     14.881786     29.726730     43.133236  L
 C-CT-0.298500(PDBName=CB,ResName=VAL,ResNum=75)              0     13.330220     28.344636     43.618487  L
 H-HC--0.029700(PDBName=HB,ResName=VAL,ResNum=75)             0     14.033992     27.528681     43.476624  L
 C-CT--0.319200(PDBName=CG1,ResName=VAL,ResNum=75)            0     13.281255     28.660762     45.119685  L
 H-HC-0.079100(PDBName=1HG1,ResName=VAL,ResNum=75)            0     14.216780     29.121226     45.434765  L
 H-HC-0.079100(PDBName=2HG1,ResName=VAL,ResNum=75)            0     12.460913     29.344083     45.336379  L
 H-HC-0.079100(PDBName=3HG1,ResName=VAL,ResNum=75)            0     13.132710     27.740921     45.685344  L
 C-CT--0.319200(PDBName=CG2,ResName=VAL,ResNum=75)            0     11.935693     27.849235     43.211089  L
 H-HC-0.079100(PDBName=1HG2,ResName=VAL,ResNum=75)            0     11.213885     28.664609     43.260533  L
 H-HC-0.079100(PDBName=2HG2,ResName=VAL,ResNum=75)            0     11.965684     27.445478     42.200368  L
 H-HC-0.079100(PDBName=3HG2,ResName=VAL,ResNum=75)            0     11.617940     27.050126     43.879307  L
 C-C-0.597300(PDBName=C,ResName=VAL,ResNum=75)                0     13.950247     29.189698     41.309704  L
 O-O--0.567900(PDBName=O,ResName=VAL,ResNum=75)               0     12.957243     29.225378     40.586007  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=76)               0     15.149245     28.887584     40.826056  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=76)                0     15.947532     28.847808     41.453604  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=76)             0     15.384993     28.480297     39.444919  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=76)              0     14.671175     28.969175     38.783910  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=76)             0     16.810960     28.883022     39.026633  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=76)             0     17.525317     28.249611     39.550634  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=76)             0     16.923950     28.689037     37.962008  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=76)              0     17.174373     30.349364     39.320884  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=76)             0     17.105813     30.549854     40.388116  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=76)            0     18.607879     30.618815     38.888700  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=76)            0     18.854602     31.665082     39.054620  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=76)            0     19.267610     30.004143     39.500657  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=76)            0     18.755165     30.372150     37.842937  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=76)            0     16.258025     31.332235     38.603392  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=76)            0     16.553876     32.340561     38.876421  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=76)            0     16.312254     31.188485     37.525523  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=76)            0     15.240429     31.185420     38.952929  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=76)                0     15.184923     26.970365     39.333973  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=76)               0     15.790700     26.221873     40.092921  L
 N-N--0.415700(PDBName=N,ResName=VAL,ResNum=77)               0     14.366633     26.518933     38.387896  L
 H-H-0.271900(PDBName=H,ResName=VAL,ResNum=77)                0     13.849350     27.183522     37.823577  L
 C-CT--0.087500(PDBName=CA,ResName=VAL,ResNum=77)             0     14.173967     25.094593     38.089360  L
 H-H1-0.096900(PDBName=HA,ResName=VAL,ResNum=77)              0     14.794841     24.517749     38.768668  L
 C-CT-0.298500(PDBName=CB,ResName=VAL,ResNum=77)              0     12.727433     24.627952     38.374520  L
 H-HC--0.029700(PDBName=HB,ResName=VAL,ResNum=77)             0     12.735864     23.547746     38.383254  L
 C-CT--0.319200(PDBName=CG1,ResName=VAL,ResNum=77)            0     12.206436     25.065193     39.750779  L
 H-HC-0.079100(PDBName=1HG1,ResName=VAL,ResNum=77)            0     12.889114     24.717717     40.518583  L
 H-HC-0.079100(PDBName=2HG1,ResName=VAL,ResNum=77)            0     12.123889     26.150470     39.806800  L
 H-HC-0.079100(PDBName=3HG1,ResName=VAL,ResNum=77)            0     11.228918     24.616693     39.932114  L
 C-CT--0.319200(PDBName=CG2,ResName=VAL,ResNum=77)            0     11.695760     25.071244     37.342456  L
 H-HC-0.079100(PDBName=1HG2,ResName=VAL,ResNum=77)            0     10.732632     24.603906     37.551735  L
 H-HC-0.079100(PDBName=2HG2,ResName=VAL,ResNum=77)            0     11.591077     26.149743     37.372432  L
 H-HC-0.079100(PDBName=3HG2,ResName=VAL,ResNum=77)            0     12.012066     24.764946     36.348536  L
 C-C-0.597300(PDBName=C,ResName=VAL,ResNum=77)                0     14.685669     24.802769     36.669368  L
 O-O--0.567900(PDBName=O,ResName=VAL,ResNum=77)               0     14.503230     25.617086     35.759102  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=78)               0     15.421603     23.706839     36.481905  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=78)                0     15.627263     23.128343     37.294765  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=78)             0     16.115870     23.382568     35.231683  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=78)             0     15.388440     23.047267     34.494541  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=78)             0     16.586675     24.287427     34.854202  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=78)                0     17.184147     22.286466     35.389401  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=78)               0     17.013320     21.386111     36.209218  L
 N-N--0.254800(PDBName=N,ResName=PRO,ResNum=79)               0     18.257934     22.296162     34.574961  L
 C-CT-0.019200(PDBName=CD,ResName=PRO,ResNum=79)              0     18.436002     23.141719     33.406072  L
 H-H1-0.039100(PDBName=2HD,ResName=PRO,ResNum=79)             0     18.971060     24.047569     33.691959  L
 H-H1-0.039100(PDBName=3HD,ResName=PRO,ResNum=79)             0     17.487323     23.397043     32.932417  L
 C-CT-0.018900(PDBName=CG,ResName=PRO,ResNum=79)              0     19.284358     22.313185     32.447943  L
 H-HC-0.021300(PDBName=2HG,ResName=PRO,ResNum=79)             0     19.865051     22.944445     31.774614  L
 H-HC-0.021300(PDBName=3HG,ResName=PRO,ResNum=79)             0     18.638828     21.638890     31.883049  L
 C-CT--0.007000(PDBName=CB,ResName=PRO,ResNum=79)             0     20.180391     21.500238     33.381169  L
 H-HC-0.025300(PDBName=2HB,ResName=PRO,ResNum=79)             0     21.095620     22.062380     33.565264  L
 H-HC-0.025300(PDBName=3HB,ResName=PRO,ResNum=79)             0     20.428456     20.532501     32.943858  L
 C-CT--0.026600(PDBName=CA,ResName=PRO,ResNum=79)             0     19.358411     21.332508     34.673081  L
 H-H1-0.064100(PDBName=HA,ResName=PRO,ResNum=79)              0     18.939408     20.325436     34.693824  L
 C-C-0.589600(PDBName=C,ResName=PRO,ResNum=79)                0     20.237411     21.542960     35.922933  L
 O-O--0.574800(PDBName=O,ResName=PRO,ResNum=79)               0     20.951471     22.537368     36.024941  L
 N-N--0.415700(PDBName=N,ResName=THR,ResNum=80)               0     20.246533     20.580760     36.844881  L
 H-H-0.271900(PDBName=H,ResName=THR,ResNum=80)                0     19.600494     19.807209     36.749812  L
 C-CT--0.038900(PDBName=CA,ResName=THR,ResNum=80)             0     21.199141     20.469066     37.968470  L
 H-H1-0.100700(PDBName=HA,ResName=THR,ResNum=80)              0     22.167119     20.850036     37.648186  L
 C-CT-0.365400(PDBName=CB,ResName=THR,ResNum=80)              0     20.735221     21.307673     39.178259  L
 H-H1-0.004300(PDBName=HB,ResName=THR,ResNum=80)              0     20.627137     22.343949     38.857970  L
 C-CT--0.243800(PDBName=CG2,ResName=THR,ResNum=80)            0     19.413197     20.857304     39.789084  L
 H-HC-0.064200(PDBName=1HG2,ResName=THR,ResNum=80)            0     19.145098     21.528010     40.604120  L
 H-HC-0.064200(PDBName=2HG2,ResName=THR,ResNum=80)            0     18.636295     20.888670     39.027383  L
 H-HC-0.064200(PDBName=3HG2,ResName=THR,ResNum=80)            0     19.484629     19.842071     40.178731  L
 O-OH--0.676100(PDBName=OG1,ResName=THR,ResNum=80)            0     21.699294     21.264872     40.202075  L
 H-HO-0.410200(PDBName=1HG,ResName=THR,ResNum=80)             0     21.240583     21.273118     41.061717  L
 C-C-0.597300(PDBName=C,ResName=THR,ResNum=80)                0     21.348059     18.991037     38.363012  L
 O-O--0.567900(PDBName=O,ResName=THR,ResNum=80)               0     20.398327     18.234666     38.151073  L
 N-N--0.254800(PDBName=N,ResName=PRO,ResNum=81)               0     22.486080     18.536910     38.928864  L
 C-CT-0.019200(PDBName=CD,ResName=PRO,ResNum=81)              0     23.781644     19.204687     38.994728  L
 H-H1-0.039100(PDBName=2HD,ResName=PRO,ResNum=81)             0     23.707839     20.249359     39.288687  L
 H-H1-0.039100(PDBName=3HD,ResName=PRO,ResNum=81)             0     24.269379     19.132664     38.021661  L
 C-CT-0.018900(PDBName=CG,ResName=PRO,ResNum=81)              0     24.592867     18.425303     40.029627  L
 H-HC-0.021300(PDBName=2HG,ResName=PRO,ResNum=81)             0     24.377342     18.807419     41.028920  L
 H-HC-0.021300(PDBName=3HG,ResName=PRO,ResNum=81)             0     25.662844     18.468087     39.824143  L
 C-CT--0.007000(PDBName=CB,ResName=PRO,ResNum=81)             0     24.050757     17.004840     39.891724  L
 H-HC-0.025300(PDBName=2HB,ResName=PRO,ResNum=81)             0     24.187464     16.429120     40.808435  L
 H-HC-0.025300(PDBName=3HB,ResName=PRO,ResNum=81)             0     24.548179     16.508099     39.057249  L
 C-CT--0.026600(PDBName=CA,ResName=PRO,ResNum=81)             0     22.571642     17.212435     39.548665  L
 H-H1-0.064100(PDBName=HA,ResName=PRO,ResNum=81)              0     22.267681     16.451474     38.828585  L
 C-C-0.589600(PDBName=C,ResName=PRO,ResNum=81)                0     21.663385     17.068921     40.782083  L
 O-O--0.574800(PDBName=O,ResName=PRO,ResNum=81)               0     21.156128     15.979325     41.032266  L
 N-N--0.415700(PDBName=N,ResName=VAL,ResNum=82)               0     21.482176     18.135482     41.573928  L
 H-H-0.271900(PDBName=H,ResName=VAL,ResNum=82)                0     21.915268     19.008363     41.303398  L
 C-CT--0.087500(PDBName=CA,ResName=VAL,ResNum=82)             0     20.569705     18.168638     42.732241  L
 H-H1-0.096900(PDBName=HA,ResName=VAL,ResNum=82)              0     19.655937     17.647255     42.441912  L
 C-CT-0.298500(PDBName=CB,ResName=VAL,ResNum=82)              0     21.198251     17.414085     43.932189  L
 H-HC--0.029700(PDBName=HB,ResName=VAL,ResNum=82)             0     21.610340     16.476384     43.560790  L
 C-CT--0.319200(PDBName=CG1,ResName=VAL,ResNum=82)            0     22.349856     18.173580     44.603915  L
 H-HC-0.079100(PDBName=1HG1,ResName=VAL,ResNum=82)            0     21.977308     19.071033     45.097835  L
 H-HC-0.079100(PDBName=2HG1,ResName=VAL,ResNum=82)            0     22.825952     17.534181     45.346605  L
 H-HC-0.079100(PDBName=3HG1,ResName=VAL,ResNum=82)            0     23.092268     18.455862     43.857303  L
 C-CT--0.319200(PDBName=CG2,ResName=VAL,ResNum=82)            0     20.169440     17.026787     45.003390  L
 H-HC-0.079100(PDBName=1HG2,ResName=VAL,ResNum=82)            0     19.845497     17.899995     45.568505  L
 H-HC-0.079100(PDBName=2HG2,ResName=VAL,ResNum=82)            0     19.311149     16.547081     44.532067  L
 H-HC-0.079100(PDBName=3HG2,ResName=VAL,ResNum=82)            0     20.623427     16.316928     45.694495  L
 C-C-0.597300(PDBName=C,ResName=VAL,ResNum=82)                0     20.177766     19.605586     43.106782  L
 O-O--0.567900(PDBName=O,ResName=VAL,ResNum=82)               0     20.851245     20.563644     42.730138  L
 N-N--0.415700(PDBName=N,ResName=ASN,ResNum=83)               0     19.098163     19.749610     43.871166  L
 H-H-0.271900(PDBName=H,ResName=ASN,ResNum=83)                0     18.496119     18.940037     43.874443  L
 C-CT-0.014300(PDBName=CA,ResName=ASN,ResNum=83)              0     18.590589     20.981602     44.471054  L
 H-H1-0.104800(PDBName=HA,ResName=ASN,ResNum=83)              0     18.297294     21.657897     43.671679  L
 C-CT--0.204100(PDBName=CB,ResName=ASN,ResNum=83)             0     17.358874     20.629251     45.330146  L
 H-HC-0.079700(PDBName=2HB,ResName=ASN,ResNum=83)             0     17.682469     20.005135     46.157519  L
 H-HC-0.079700(PDBName=3HB,ResName=ASN,ResNum=83)             0     16.937189     21.538664     45.745980  L
 C-C-0.713000(PDBName=CG,ResName=ASN,ResNum=83)               0     16.270692     19.891212     44.581347  L
 O-O--0.593100(PDBName=OD1,ResName=ASN,ResNum=83)             0     15.397402     20.473331     43.952151  L
 N-N--0.919100(PDBName=ND2,ResName=ASN,ResNum=83)             0     16.262802     18.580931     44.664647  L
 H-H-0.419600(PDBName=1HD2,ResName=ASN,ResNum=83)             0     16.050294     18.159289     43.753835  L
 H-H-0.419600(PDBName=2HD2,ResName=ASN,ResNum=83)             0     16.930770     18.153261     45.282210  L
 C-C-0.597300(PDBName=C,ResName=ASN,ResNum=83)                0     19.641895     21.686633     45.348679  L
 O-O--0.567900(PDBName=O,ResName=ASN,ResNum=83)               0     20.095926     21.110160     46.337017  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=84)               0     19.952573     22.950632     45.053934  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=84)                0     19.552585     23.335275     44.204082  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=84)             0     20.884930     23.829288     45.776056  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=84)              0     21.233894     23.320786     46.673090  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=84)              0     22.115675     24.193679     44.905231  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=84)              0     21.798782     24.941084     44.179236  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=84)            0     23.198755     24.848956     45.776226  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=84)            0     23.516660     24.166365     46.563613  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=84)            0     24.061853     25.118413     45.165666  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=84)            0     22.811395     25.759057     46.234022  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=84)            0     22.716333     23.043028     44.072016  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=84)            0     21.971395     22.713900     43.351242  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=84)            0     23.552048     23.431878     43.490134  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=84)            0     23.205164     21.831949     44.873874  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=84)            0     23.474444     21.030593     44.186782  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=84)            0     24.075845     22.106838     45.467450  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=84)            0     22.425533     21.461464     45.528291  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=84)                0     20.149328     25.114439     46.179227  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=84)               0     19.686360     25.857732     45.315018  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=85)               0     20.030616     25.396745     47.477104  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=85)                0     20.553728     24.803382     48.112639  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=85)             0     19.489559     26.662309     47.993103  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=85)              0     18.725841     27.027783     47.311173  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=85)              0     18.839271     26.489348     49.380353  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=85)              0     19.624474     26.233850     50.088940  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=85)            0     18.205000     27.807642     49.853053  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=85)            0     17.730259     27.665528     50.822136  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=85)            0     18.964412     28.580350     49.958495  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=85)            0     17.464261     28.145051     49.131004  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=85)            0     17.780523     25.367165     49.431067  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=85)            0     18.291189     24.410480     49.337058  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=85)            0     17.298953     25.378473     50.409714  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=85)            0     16.690212     25.446487     48.354137  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=85)            0     16.213366     26.425104     48.354729  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=85)            0     17.118946     25.242599     47.374563  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=85)            0     15.931404     24.698184     48.557712  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=85)                0     20.607326     27.702125     48.056283  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=85)               0     21.622973     27.484675     48.714855  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=86)               0     20.392298     28.839944     47.399558  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=86)                0     19.482263     28.947911     46.967676  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=86)             0     21.312065     29.973570     47.360839  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=86)             0     22.282493     29.681716     47.765050  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=86)             0     21.450439     30.286063     46.325868  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=86)                0     20.811424     31.169785     48.166187  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=86)               0     19.708884     31.180150     48.723122  L
 N-N--0.347900(PDBName=N,ResName=ARG,ResNum=87)               0     21.642871     32.206920     48.241013  L
 H-H-0.274700(PDBName=H,ResName=ARG,ResNum=87)                0     22.519522     32.103312     47.732471  L
 C-CT--0.263700(PDBName=CA,ResName=ARG,ResNum=87)             0     21.435296     33.426670     49.034939  L
 H-H1-0.156000(PDBName=HA,ResName=ARG,ResNum=87)              0     21.330637     33.122199     50.069789  L
 C-CT--0.000700(PDBName=CB,ResName=ARG,ResNum=87)             0     22.696803     34.302018     48.959969  L
 H-HC-0.032700(PDBName=2HB,ResName=ARG,ResNum=87)             0     23.004914     34.430215     47.922070  L
 H-HC-0.032700(PDBName=3HB,ResName=ARG,ResNum=87)             0     22.492319     35.279734     49.399788  L
 C-CT-0.039000(PDBName=CG,ResName=ARG,ResNum=87)              0     23.803199     33.607746     49.778333  L
 H-HC-0.028500(PDBName=2HG,ResName=ARG,ResNum=87)             0     23.429610     33.504870     50.790941  L
 H-HC-0.028500(PDBName=3HG,ResName=ARG,ResNum=87)             0     23.984970     32.599601     49.403137  L
 C-CT-0.048600(PDBName=CD,ResName=ARG,ResNum=87)              0     25.139005     34.356109     49.828692  L
 H-H1-0.068700(PDBName=2HD,ResName=ARG,ResNum=87)             0     24.969028     35.427500     49.913060  L
 H-H1-0.068700(PDBName=3HD,ResName=ARG,ResNum=87)             0     25.676428     34.036684     50.722166  L
 N-N2--0.529500(PDBName=NE,ResName=ARG,ResNum=87)             0     25.974266     34.027144     48.665213  L
 H-H-0.345600(PDBName=HE,ResName=ARG,ResNum=87)               0     26.498824     33.159169     48.732424  L
 C-CA-0.807600(PDBName=CZ,ResName=ARG,ResNum=87)              0     26.041567     34.661701     47.514562  L
 N-N2--0.862700(PDBName=NH1,ResName=ARG,ResNum=87)            0     26.732658     34.177487     46.530792  L
 H-H-0.447800(PDBName=1HH1,ResName=ARG,ResNum=87)             0     27.092795     33.229514     46.551192  L
 H-H-0.447800(PDBName=2HH1,ResName=ARG,ResNum=87)             0     26.614805     34.660813     45.643142  L
 N-N2--0.862700(PDBName=NH2,ResName=ARG,ResNum=87)            0     25.445124     35.794004     47.272124  L
 H-H-0.447800(PDBName=1HH2,ResName=ARG,ResNum=87)             0     24.959389     36.295813     48.005136  L
 H-H-0.447800(PDBName=2HH2,ResName=ARG,ResNum=87)             0     25.480386     36.122193     46.309129  L
 C-C-0.734100(PDBName=C,ResName=ARG,ResNum=87)                0     20.118949     34.162424     48.770559  L
 O-O--0.589400(PDBName=O,ResName=ARG,ResNum=87)               0     19.581587     34.741981     49.709542  L
 N-N--0.415700(PDBName=N,ResName=ASN,ResNum=88)               0     19.522784     34.058128     47.582231  L
 H-H-0.271900(PDBName=H,ResName=ASN,ResNum=88)                0     20.057583     33.583497     46.861752  L
 C-CT-0.014300(PDBName=CA,ResName=ASN,ResNum=88)              0     18.151259     34.510542     47.288974  L
 H-H1-0.104800(PDBName=HA,ResName=ASN,ResNum=88)              0     18.138882     35.587159     47.467058  L
 C-CT--0.204100(PDBName=CB,ResName=ASN,ResNum=88)             0     17.851238     34.309835     45.784691  L
 H-HC-0.079700(PDBName=2HB,ResName=ASN,ResNum=88)             0     17.041650     34.988494     45.518582  L
 H-HC-0.079700(PDBName=3HB,ResName=ASN,ResNum=88)             0     18.724563     34.590012     45.195687  L
 C-C-0.713000(PDBName=CG,ResName=ASN,ResNum=88)               0     17.406571     32.915770     45.365470  L
 O-O--0.593100(PDBName=OD1,ResName=ASN,ResNum=88)             0     17.377567     31.955860     46.118310  L
 N-N--0.919100(PDBName=ND2,ResName=ASN,ResNum=88)             0     17.050251     32.728843     44.118600  L
 H-H-0.419600(PDBName=1HD2,ResName=ASN,ResNum=88)             0     16.371928     31.987048     44.014509  L
 H-H-0.419600(PDBName=2HD2,ResName=ASN,ResNum=88)             0     17.227569     33.399300     43.367975  L
 C-C-0.597300(PDBName=C,ResName=ASN,ResNum=88)                0     17.060895     33.935752     48.239168  L
 O-O--0.567900(PDBName=O,ResName=ASN,ResNum=88)               0     15.981936     34.517196     48.368721  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=89)               0     17.360615     32.832320     48.934716  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=89)                0     18.221947     32.368207     48.667613  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=89)             0     16.582987     32.216752     50.011950  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=89)              0     15.662716     32.783665     50.142856  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=89)             0     16.239296     30.763115     49.633807  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=89)             0     16.959151     30.409972     48.895363  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=89)             0     16.340488     30.126764     50.514397  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=89)              0     14.818293     30.586385     49.077133  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=89)             0     14.655325     31.275472     48.248183  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=89)            0     14.632615     29.156375     48.571869  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=89)            0     15.360830     28.955467     47.789846  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=89)            0     14.781167     28.445003     49.383451  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=89)            0     13.636317     29.031527     48.154359  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=89)            0     13.768977     30.831468     50.164789  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=89)            0     14.017100     30.255904     51.056305  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=89)            0     13.735767     31.888195     50.421862  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=89)            0     12.782508     30.534741     49.818527  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=89)                0     17.306524     32.279926     51.365499  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=89)               0     16.673228     32.624568     52.361056  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=90)               0     18.608372     31.959000     51.425698  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=90)                0     19.044327     31.646615     50.564559  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=90)             0     19.385403     31.971044     52.681771  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=90)              0     18.901729     31.271116     53.360833  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=90)             0     20.828815     31.466688     52.477894  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=90)             0     21.382349     32.199088     51.898851  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=90)             0     21.306917     31.419273     53.452323  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=90)              0     20.981871     30.079886     51.825237  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=90)             0     20.524094     30.089976     50.842091  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=90)            0     22.463763     29.755238     51.654411  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=90)            0     22.949382     30.525739     51.055457  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=90)            0     22.954076     29.681228     52.624512  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=90)            0     22.567641     28.808427     51.124966  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=90)            0     20.342811     28.960503     52.649098  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=90)            0     20.772971     28.935958     53.650533  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=90)            0     19.266992     29.114674     52.717385  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=90)            0     20.519618     28.004930     52.156199  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=90)                0     19.355289     33.336146     53.408024  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=90)               0     19.370186     33.374834     54.636292  L
 N-N--0.415700(PDBName=N,ResName=THR,ResNum=91)               0     19.251408     34.448561     52.671479  L
 H-H-0.271900(PDBName=H,ResName=THR,ResNum=91)                0     19.278421     34.343547     51.666132  L
 C-CT--0.038900(PDBName=CA,ResName=THR,ResNum=91)             0     18.950450     35.787060     53.223032  L
 H-H1-0.100700(PDBName=HA,ResName=THR,ResNum=91)              0     19.779152     36.095278     53.860642  L
 C-CT-0.365400(PDBName=CB,ResName=THR,ResNum=91)              0     18.750419     36.851860     52.132290  L
 H-H1-0.004300(PDBName=HB,ResName=THR,ResNum=91)              0     18.243494     37.712775     52.570771  L
 C-CT--0.243800(PDBName=CG2,ResName=THR,ResNum=91)            0     20.072780     37.338674     51.567005  L
 H-HC-0.064200(PDBName=1HG2,ResName=THR,ResNum=91)            0     20.618811     36.519333     51.106130  L
 H-HC-0.064200(PDBName=2HG2,ResName=THR,ResNum=91)            0     19.893568     38.122905     50.831710  L
 H-HC-0.064200(PDBName=3HG2,ResName=THR,ResNum=91)            0     20.663896     37.735121     52.387544  L
 O-OH--0.676100(PDBName=OG1,ResName=THR,ResNum=91)            0     17.968419     36.365838     51.065205  L
 H-HO-0.410200(PDBName=1HG,ResName=THR,ResNum=91)             0     18.560516     35.835063     50.502187  L
 C-C-0.597300(PDBName=C,ResName=THR,ResNum=91)                0     17.697443     35.817553     54.093443  L
 O-O--0.567900(PDBName=O,ResName=THR,ResNum=91)               0     17.736749     36.335833     55.203022  L
 N-N--0.415700(PDBName=N,ResName=GLN,ResNum=92)               0     16.579354     35.305118     53.579482  L
 H-H-0.271900(PDBName=H,ResName=GLN,ResNum=92)                0     16.671184     34.858711     52.677353  L
 C-CT--0.003100(PDBName=CA,ResName=GLN,ResNum=92)             0     15.241173     35.402601     54.170488  L
 H-H1-0.085000(PDBName=HA,ResName=GLN,ResNum=92)              0     15.006177     36.456923     54.323947  L
 C-CT--0.003600(PDBName=CB,ResName=GLN,ResNum=92)             0     14.205757     34.809180     53.204883  L
 H-HC-0.017100(PDBName=2HB,ResName=GLN,ResNum=92)             0     14.386337     33.741006     53.082758  L
 H-HC-0.017100(PDBName=3HB,ResName=GLN,ResNum=92)             0     13.217292     34.938683     53.648699  L
 C-CT--0.064500(PDBName=CG,ResName=GLN,ResNum=92)             0     14.231341     35.485195     51.822859  L
 H-HC-0.035200(PDBName=2HG,ResName=GLN,ResNum=92)             0     14.104908     36.560784     51.945509  L
 H-HC-0.035200(PDBName=3HG,ResName=GLN,ResNum=92)             0     15.188919     35.298920     51.335635  L
 C-C-0.695100(PDBName=CD,ResName=GLN,ResNum=92)               0     13.114908     34.972782     50.926151  L
 O-O--0.608600(PDBName=OE1,ResName=GLN,ResNum=92)             0     11.972442     34.828967     51.334073  L
 N-N--0.940700(PDBName=NE2,ResName=GLN,ResNum=92)             0     13.379607     34.670596     49.675775  L
 H-H-0.425100(PDBName=1HE2,ResName=GLN,ResNum=92)             0     12.549383     34.431396     49.149085  L
 H-H-0.425100(PDBName=2HE2,ResName=GLN,ResNum=92)             0     14.303222     34.766966     49.259993  L
 C-C-0.597300(PDBName=C,ResName=GLN,ResNum=92)                0     15.153441     34.722095     55.541461  L
 O-O--0.567900(PDBName=O,ResName=GLN,ResNum=92)               0     14.581894     35.275637     56.474898  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=93)               0     15.739243     33.528213     55.660979  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=93)                0     16.167411     33.148275     54.828145  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=93)             0     15.895439     32.803258     56.933416  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=93)              0     14.952896     32.881277     57.475624  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=93)              0     16.145540     31.297441     56.674354  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=93)              0     16.241449     30.799450     57.638270  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=93)            0     14.926571     30.681846     55.960697  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=93)            0     14.999151     29.595092     55.969728  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=93)            0     14.012300     30.964830     56.485520  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=93)            0     14.873418     31.031854     54.930396  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=93)            0     17.449900     31.059592     55.885455  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=93)            0     17.417009     31.626649     54.958333  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=93)            0     18.283431     31.425865     56.483429  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=93)            0     17.726177     29.595463     55.526766  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=93)            0     17.087812     29.291380     54.700026  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=93)            0     18.767553     29.484973     55.226117  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=93)            0     17.529431     28.952970     56.381118  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=93)                0     16.963320     33.423409     57.864802  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=93)               0     17.064823     33.033889     59.024321  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=94)               0     17.752706     34.392551     57.387117  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=94)                0     17.569378     34.728796     56.451364  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=94)             0     18.768435     35.117814     58.159866  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=94)             0     18.997272     36.055712     57.655219  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=94)             0     18.368902     35.352561     59.147087  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=94)                0     20.076452     34.345231     58.348994  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=94)               0     20.731548     34.487626     59.378137  L
 N-N--0.415700(PDBName=N,ResName=ALA,ResNum=95)               0     20.471135     33.533103     57.364948  L
 H-H-0.271900(PDBName=H,ResName=ALA,ResNum=95)                0     19.912311     33.505270     56.520113  L
 C-CT-0.033700(PDBName=CA,ResName=ALA,ResNum=95)              0     21.569427     32.582841     57.505355  L
 H-H1-0.082300(PDBName=HA,ResName=ALA,ResNum=95)              0     21.357954     31.973974     58.384665  L
 C-CT--0.182500(PDBName=CB,ResName=ALA,ResNum=95)             0     21.587070     31.663555     56.284913  L
 H-HC-0.060300(PDBName=1HB,ResName=ALA,ResNum=95)             0     21.837391     32.253604     55.405793  L
 H-HC-0.060300(PDBName=2HB,ResName=ALA,ResNum=95)             0     22.335693     30.886829     56.427208  L
 H-HC-0.060300(PDBName=3HB,ResName=ALA,ResNum=95)             0     20.612592     31.195071     56.150511  L
 C-C-0.597300(PDBName=C,ResName=ALA,ResNum=95)                0     22.949277     33.234668     57.714860  L
 O-O--0.567900(PDBName=O,ResName=ALA,ResNum=95)               0     23.318332     34.228431     57.082791  L
 N-N--0.415700(PDBName=N,ResName=THR,ResNum=96)               0     23.752374     32.592241     58.556862  L
 H-H-0.271900(PDBName=H,ResName=THR,ResNum=96)                0     23.354389     31.782783     59.021824  L
 C-CT--0.038900(PDBName=CA,ResName=THR,ResNum=96)             0     25.096880     32.992336     58.984330  L
 H-H1-0.100700(PDBName=HA,ResName=THR,ResNum=96)              0     25.437992     33.831685     58.383107  L
 C-CT-0.365400(PDBName=CB,ResName=THR,ResNum=96)              0     25.099162     33.423741     60.462357  L
 H-H1-0.004300(PDBName=HB,ResName=THR,ResNum=96)              0     26.122508     33.664788     60.750213  L
 C-CT--0.243800(PDBName=CG2,ResName=THR,ResNum=96)            0     24.233602     34.656099     60.710813  L
 H-HC-0.064200(PDBName=1HG2,ResName=THR,ResNum=96)            0     24.323900     34.952049     61.756082  L
 H-HC-0.064200(PDBName=2HG2,ResName=THR,ResNum=96)            0     24.568919     35.474852     60.077751  L
 H-HC-0.064200(PDBName=3HG2,ResName=THR,ResNum=96)            0     23.186587     34.438243     60.499361  L
 O-OH--0.676100(PDBName=OG1,ResName=THR,ResNum=96)            0     24.626079     32.403081     61.310973  L
 H-HO-0.410200(PDBName=1HG,ResName=THR,ResNum=96)             0     23.775345     32.087369     60.968769  L
 C-C-0.597300(PDBName=C,ResName=THR,ResNum=96)                0     26.075456     31.839601     58.781358  L
 O-O--0.567900(PDBName=O,ResName=THR,ResNum=96)               0     25.739790     30.690083     59.055213  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=97)               0     27.276763     32.135518     58.282009  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=97)                0     27.460697     33.092530     58.000971  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=97)             0     28.341802     31.168147     58.001914  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=97)              0     28.019089     30.173441     58.299094  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=97)             0     28.593808     31.179459     56.479027  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=97)             0     27.624292     31.169108     55.986021  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=97)             0     29.069813     32.124631     56.213053  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=97)              0     29.423023     30.037015     55.859699  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=97)             0     29.591874     30.303691     54.816973  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=97)            0     30.795358     29.815567     56.494706  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=97)            0     30.694216     29.318577     57.459011  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=97)            0     31.395872     29.180316     55.844209  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=97)            0     31.299624     30.772470     56.624216  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=97)            0     28.665071     28.711512     55.873600  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=97)            0     27.702584     28.830929     55.379238  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=97)            0     29.242172     27.962452     55.333966  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=97)            0     28.508465     28.376003     56.898345  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=97)                0     29.586363     31.564691     58.805333  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=97)               0     30.091576     32.668119     58.610925  L
 N-N--0.415700(PDBName=N,ResName=ASN,ResNum=98)               0     30.090015     30.700750     59.690351  L
 H-H-0.271900(PDBName=H,ResName=ASN,ResNum=98)                0     29.625155     29.800524     59.774628  L
 C-CT-0.014300(PDBName=CA,ResName=ASN,ResNum=98)              0     31.308900     30.947662     60.472035  L
 H-H1-0.104800(PDBName=HA,ResName=ASN,ResNum=98)              0     31.749056     31.888183     60.135147  L
 C-CT--0.204100(PDBName=CB,ResName=ASN,ResNum=98)             0     30.957586     31.123069     61.963272  L
 H-HC-0.079700(PDBName=2HB,ResName=ASN,ResNum=98)             0     30.209744     31.908163     62.073171  L
 H-HC-0.079700(PDBName=3HB,ResName=ASN,ResNum=98)             0     30.555604     30.194337     62.366703  L
 C-C-0.713000(PDBName=CG,ResName=ASN,ResNum=98)               0     32.197178     31.536697     62.739164  L
 O-O--0.593100(PDBName=OD1,ResName=ASN,ResNum=98)             0     32.659485     32.659454     62.631275  L
 N-N--0.919100(PDBName=ND2,ResName=ASN,ResNum=98)             0     32.854654     30.625670     63.412336  L
 H-H-0.419600(PDBName=1HD2,ResName=ASN,ResNum=98)             0     33.829604     30.881426     63.546046  L
 H-H-0.419600(PDBName=2HD2,ResName=ASN,ResNum=98)             0     32.556389     29.670181     63.461175  L
 C-C-0.597300(PDBName=C,ResName=ASN,ResNum=98)                0     32.389961     29.870793     60.252592  L
 O-O--0.567900(PDBName=O,ResName=ASN,ResNum=98)               0     32.082703     28.706075     60.001440  L
 N-N--0.382100(PDBName=N,ResName=PHE,ResNum=99)               0     33.648924     30.292475     60.401332  L
 H-H-0.268100(PDBName=H,ResName=PHE,ResNum=99)                0     33.754222     31.233079     60.750701  L
 C-CT--0.182500(PDBName=CA,ResName=PHE,ResNum=99)             0     34.910610     29.536126     60.393656  L
 H-H1-0.109800(PDBName=HA,ResName=PHE,ResNum=99)              0     34.716854     28.499202     60.666501  L
 C-CT--0.095900(PDBName=CB,ResName=PHE,ResNum=99)             0     35.492040     29.575817     58.966918  L
 H-HC-0.044300(PDBName=2HB,ResName=PHE,ResNum=99)             0     36.356002     28.913606     58.933632  L
 H-HC-0.044300(PDBName=3HB,ResName=PHE,ResNum=99)             0     34.754345     29.168703     58.273733  L
 C-CA-0.055200(PDBName=CG,ResName=PHE,ResNum=99)              0     35.920748     30.951084     58.477298  L
 C-CA--0.130000(PDBName=CD1,ResName=PHE,ResNum=99)            0     34.983556     31.842007     57.921431  L
 H-HA-0.140800(PDBName=HD1,ResName=PHE,ResNum=99)             0     33.946081     31.549946     57.834339  L
 C-CA--0.184700(PDBName=CE1,ResName=PHE,ResNum=99)            0     35.388837     33.118702     57.488432  L
 H-HA-0.146100(PDBName=HE1,ResName=PHE,ResNum=99)             0     34.658231     33.800500     57.072426  L
 C-CA--0.094400(PDBName=CZ,ResName=PHE,ResNum=99)             0     36.735488     33.506317     57.589162  L
 H-HA-0.128000(PDBName=HZ,ResName=PHE,ResNum=99)              0     37.049673     34.480364     57.239038  L
 C-CA--0.184700(PDBName=CE2,ResName=PHE,ResNum=99)            0     37.676835     32.614332     58.127184  L
 H-HA-0.146100(PDBName=HE2,ResName=PHE,ResNum=99)             0     38.720648     32.893589     58.194055  L
 C-CA--0.130000(PDBName=CD2,ResName=PHE,ResNum=99)            0     37.265972     31.348007     58.579272  L
 H-HA-0.140800(PDBName=HD2,ResName=PHE,ResNum=99)             0     37.988612     30.671780     59.007770  L
 C-C-0.766000(PDBName=C,ResName=PHE,ResNum=99)                0     35.888885     30.101222     61.450625  L
 O-O2--0.802600(PDBName=O,ResName=PHE,ResNum=99)              0     35.470872     31.055167     62.150647  L
 O-O2--0.802600(PDBName=OXT,ResName=PHE,ResNum=99)            0     37.051001     29.650968     61.518327  L
 N-N3--0.202000(PDBName=N,ResName=PRO,ResNum=100)             0     35.638397     33.460210     60.897602  L
 H-H-0.312000(PDBName=H2,ResName=PRO,ResNum=100)              0     35.475879     33.239418     59.919064  L
 H-H-0.312000(PDBName=H3,ResName=PRO,ResNum=100)              0     35.507617     32.600565     61.440235  L
 C-CT--0.012000(PDBName=CD,ResName=PRO,ResNum=100)            0     37.001344     33.987816     61.107779  L
 H-HP-0.100000(PDBName=2HD,ResName=PRO,ResNum=100)            0     37.487679     34.128379     60.140599  L
 H-HP-0.100000(PDBName=3HD,ResName=PRO,ResNum=100)            0     37.595323     33.290807     61.706614  L
 C-CT--0.121000(PDBName=CG,ResName=PRO,ResNum=100)            0     36.874028     35.339314     61.812306  L
 H-HC-0.100000(PDBName=2HG,ResName=PRO,ResNum=100)            0     37.670008     36.026118     61.516471  L
 H-HC-0.100000(PDBName=3HG,ResName=PRO,ResNum=100)            0     36.884419     35.191264     62.895476  L
 C-CT--0.115000(PDBName=CB,ResName=PRO,ResNum=100)            0     35.495134     35.823396     61.357537  L
 H-HC-0.100000(PDBName=2HB,ResName=PRO,ResNum=100)            0     35.547941     36.230282     60.344082  L
 H-HC-0.100000(PDBName=3HB,ResName=PRO,ResNum=100)            0     35.071841     36.557713     62.045971  L
 C-CT-0.100000(PDBName=CA,ResName=PRO,ResNum=100)             0     34.706815     34.511674     61.364677  L
 H-HP-0.100000(PDBName=HA,ResName=PRO,ResNum=100)             0     34.437102     34.278228     62.396872  L
 C-C-0.526000(PDBName=C,ResName=PRO,ResNum=100)               0     33.405630     34.572600     60.551223  L
 O-O--0.500000(PDBName=O,ResName=PRO,ResNum=100)              0     33.328324     33.979009     59.479124  L
 N-N--0.415700(PDBName=N,ResName=GLN,ResNum=101)              0     32.378925     35.254780     61.066352  L
 H-H-0.271900(PDBName=H,ResName=GLN,ResNum=101)               0     32.478884     35.692127     61.968942  L
 C-CT--0.003100(PDBName=CA,ResName=GLN,ResNum=101)            0     31.037098     35.241847     60.479267  L
 H-H1-0.085000(PDBName=HA,ResName=GLN,ResNum=101)             0     30.777268     34.203643     60.287552  L
 C-CT--0.003600(PDBName=CB,ResName=GLN,ResNum=101)            0     30.029194     35.786646     61.505204  L
 H-HC-0.017100(PDBName=2HB,ResName=GLN,ResNum=101)            0     30.160812     35.245432     62.444017  L
 H-HC-0.017100(PDBName=3HB,ResName=GLN,ResNum=101)            0     30.227783     36.844603     61.685516  L
 C-CT--0.064500(PDBName=CG,ResName=GLN,ResNum=101)            0     28.570704     35.614983     61.041209  L
 H-HC-0.035200(PDBName=2HG,ResName=GLN,ResNum=101)            0     28.415056     36.150047     60.105474  L
 H-HC-0.035200(PDBName=3HG,ResName=GLN,ResNum=101)            0     28.368814     34.556343     60.877792  L
 C-C-0.695100(PDBName=CD,ResName=GLN,ResNum=101)              0     27.576817     36.143231     62.069079  L
 O-O--0.608600(PDBName=OE1,ResName=GLN,ResNum=101)            0     27.659730     35.871568     63.251153  L
 N-N--0.940700(PDBName=NE2,ResName=GLN,ResNum=101)            0     26.589646     36.913541     61.671574  L
 H-H-0.425100(PDBName=1HE2,ResName=GLN,ResNum=101)            0     25.985835     37.172767     62.431801  L
 H-H-0.425100(PDBName=2HE2,ResName=GLN,ResNum=101)            0     26.423672     37.175469     60.708764  L
 C-C-0.597300(PDBName=C,ResName=GLN,ResNum=101)               0     30.940208     36.029346     59.159777  L
 O-O--0.567900(PDBName=O,ResName=GLN,ResNum=101)              0     31.354794     37.184089     59.084411  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=102)              0     30.270213     35.442185     58.165790  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=102)               0     30.055862     34.456208     58.288033  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=102)            0     29.663207     36.129538     57.020624  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=102)             0     29.791959     37.205803     57.143959  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=102)             0     30.332270     35.727299     55.681339  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=102)             0     30.194514     34.655012     55.527600  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=102)           0     29.650723     36.478801     54.517138  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=102)           0     29.795893     37.554408     54.627708  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=102)           0     30.064669     36.156193     53.564078  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=102)           0     28.584028     36.259015     54.487717  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=102)           0     31.851851     36.025343     55.713012  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=102)           0     32.009031     37.077817     55.954080  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=102)           0     32.310132     35.429546     56.503240  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=102)           0     32.604328     35.704588     54.413302  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=102)           0     32.372287     34.692248     54.085743  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=102)           0     32.333487     36.414142     53.632050  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=102)           0     33.676733     35.785612     54.590876  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=102)               0     28.159741     35.822381     57.032220  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=102)              0     27.744517     34.674533     56.872019  L
 N-N--0.415700(PDBName=N,ResName=THR,ResNum=103)              0     27.326575     36.843459     57.239922  L
 H-H-0.271900(PDBName=H,ResName=THR,ResNum=103)               0     27.717465     37.751494     57.439043  L
 C-CT--0.038900(PDBName=CA,ResName=THR,ResNum=103)            0     25.868289     36.738043     57.056120  L
 H-H1-0.100700(PDBName=HA,ResName=THR,ResNum=103)             0     25.527096     35.805267     57.501387  L
 C-CT-0.365400(PDBName=CB,ResName=THR,ResNum=103)             0     25.126256     37.882491     57.756143  L
 H-H1-0.004300(PDBName=HB,ResName=THR,ResNum=103)             0     25.319637     38.818518     57.233054  L
 C-CT--0.243800(PDBName=CG2,ResName=THR,ResNum=103)           0     23.621353     37.622549     57.829073  L
 H-HC-0.064200(PDBName=1HG2,ResName=THR,ResNum=103)           0     23.193322     37.603801     56.827289  L
 H-HC-0.064200(PDBName=2HG2,ResName=THR,ResNum=103)           0     23.425210     36.666036     58.315052  L
 H-HC-0.064200(PDBName=3HG2,ResName=THR,ResNum=103)           0     23.131516     38.407641     58.403484  L
 O-OH--0.676100(PDBName=OG1,ResName=THR,ResNum=103)           0     25.573389     38.001334     59.090750  L
 H-HO-0.410200(PDBName=1HG,ResName=THR,ResNum=103)            0     25.014492     38.666639     59.506478  L
 C-C-0.597300(PDBName=C,ResName=THR,ResNum=103)               0     25.546483     36.708124     55.558693  L
 O-O--0.567900(PDBName=O,ResName=THR,ResNum=103)              0     26.081330     37.499282     54.775639  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=104)              0     24.726013     35.753565     55.126638  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=104)               0     24.262667     35.176792     55.825362  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=104)            0     24.675513     35.298940     53.737702  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=104)             0     25.653466     35.458851     53.283664  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=104)            0     24.407436     33.781336     53.734057  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=104)            0     23.474032     33.589472     54.264769  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=104)            0     24.274137     33.459635     52.708471  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=104)             0     25.521696     32.905174     54.335043  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=104)            0     25.642051     33.124812     55.395965  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=104)           0     25.106066     31.443231     54.175272  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=104)           0     24.947003     31.205931     53.124236  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=104)           0     25.880788     30.792728     54.572623  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=104)           0     24.183802     31.266938     54.726226  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=104)           0     26.863884     33.096366     53.620782  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=104)           0     27.261677     34.087690     53.830224  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=104)           0     27.588724     32.371622     53.986264  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=104)           0     26.750865     32.960137     52.545800  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=104)               0     23.692978     36.095596     52.857702  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=104)              0     22.743146     35.544998     52.304915  L
 N-N--0.415700(PDBName=N,ResName=TRP,ResNum=105)              0     24.006480     37.375929     52.630619  L
 H-H-0.271900(PDBName=H,ResName=TRP,ResNum=105)               0     24.768300     37.737938     53.191762  L
 C-CT--0.027500(PDBName=CA,ResName=TRP,ResNum=105)            0     23.501892     38.161029     51.491496  L
 H-H1-0.112300(PDBName=HA,ResName=TRP,ResNum=105)             0     22.676767     37.619665     51.031371  L
 C-CT--0.005000(PDBName=CB,ResName=TRP,ResNum=105)            0     22.941793     39.530334     51.937675  L
 H-HC-0.033900(PDBName=2HB,ResName=TRP,ResNum=105)            0     22.525872     40.025033     51.058764  L
 H-HC-0.033900(PDBName=3HB,ResName=TRP,ResNum=105)            0     22.109636     39.352896     52.615958  L
 C-C*--0.141500(PDBName=CG,ResName=TRP,ResNum=105)            0     23.855521     40.503441     52.627688  L
 C-CW--0.163800(PDBName=CD1,ResName=TRP,ResNum=105)           0     24.675777     41.390101     52.014911  L
 H-H4-0.206200(PDBName=HD1,ResName=TRP,ResNum=105)            0     24.790991     41.500651     50.943269  L
 N-NA--0.341800(PDBName=NE1,ResName=TRP,ResNum=105)           0     25.370124     42.110474     52.966013  L
 H-H-0.341200(PDBName=HE1,ResName=TRP,ResNum=105)             0     26.134660     42.747689     52.767050  L
 C-CN-0.138000(PDBName=CE2,ResName=TRP,ResNum=105)            0     24.955232     41.799793     54.240244  L
 C-CA--0.260100(PDBName=CZ2,ResName=TRP,ResNum=105)           0     25.321851     42.284429     55.503345  L
 H-HA-0.157200(PDBName=HZ2,ResName=TRP,ResNum=105)            0     26.074015     43.055171     55.593245  L
 C-CA--0.113400(PDBName=CH2,ResName=TRP,ResNum=105)           0     24.658225     41.792584     56.638985  L
 H-HA-0.141700(PDBName=HH2,ResName=TRP,ResNum=105)            0     24.896429     42.185156     57.618905  L
 C-CA--0.197200(PDBName=CZ3,ResName=TRP,ResNum=105)           0     23.656257     40.816724     56.493267  L
 H-HA-0.144700(PDBName=HZ3,ResName=TRP,ResNum=105)            0     23.117028     40.477580     57.366107  L
 C-CA--0.238700(PDBName=CE3,ResName=TRP,ResNum=105)           0     23.335984     40.297266     55.222876  L
 H-HA-0.170000(PDBName=HE3,ResName=TRP,ResNum=105)            0     22.561678     39.550426     55.125422  L
 C-CB-0.124300(PDBName=CD2,ResName=TRP,ResNum=105)            0     23.976343     40.778245     54.059673  L
 C-C-0.597300(PDBName=C,ResName=TRP,ResNum=105)               0     24.567897     38.266612     50.394997  L
 O-O--0.567900(PDBName=O,ResName=TRP,ResNum=105)              0     24.392060     37.754256     49.286260  L
 N-N--0.415700(PDBName=N,ResName=GLN,ResNum=106)              0     25.690037     38.911625     50.713918  L
 H-H-0.271900(PDBName=H,ResName=GLN,ResNum=106)               0     25.728275     39.307820     51.642869  L
 C-CT--0.003100(PDBName=CA,ResName=GLN,ResNum=106)            0     26.822981     39.115178     49.814823  L
 H-H1-0.085000(PDBName=HA,ResName=GLN,ResNum=106)             0     26.456782     39.650411     48.937843  L
 C-CT--0.003600(PDBName=CB,ResName=GLN,ResNum=106)            0     27.883580     39.999039     50.496817  L
 H-HC-0.017100(PDBName=2HB,ResName=GLN,ResNum=106)            0     28.717794     40.129020     49.805619  L
 H-HC-0.017100(PDBName=3HB,ResName=GLN,ResNum=106)            0     27.450569     40.988159     50.651054  L
 C-CT--0.064500(PDBName=CG,ResName=GLN,ResNum=106)            0     28.443964     39.455368     51.832552  L
 H-HC-0.035200(PDBName=2HG,ResName=GLN,ResNum=106)            0     28.088266     38.442213     52.020372  L
 H-HC-0.035200(PDBName=3HG,ResName=GLN,ResNum=106)            0     29.531157     39.414399     51.762641  L
 C-C-0.695100(PDBName=CD,ResName=GLN,ResNum=106)              0     28.090230     40.350645     53.018097  L
 O-O--0.608600(PDBName=OE1,ResName=GLN,ResNum=106)            0     28.305890     41.550478     53.006655  L
 N-N--0.940700(PDBName=NE2,ResName=GLN,ResNum=106)            0     27.502944     39.835238     54.073312  L
 H-H-0.425100(PDBName=1HE2,ResName=GLN,ResNum=106)            0     27.250203     40.529348     54.756137  L
 H-H-0.425100(PDBName=2HE2,ResName=GLN,ResNum=106)            0     27.212335     38.868804     54.169499  L
 C-C-0.597300(PDBName=C,ResName=GLN,ResNum=106)               0     27.444101     37.801989     49.322349  L
 O-O--0.567900(PDBName=O,ResName=GLN,ResNum=106)              0     27.408446     36.779888     50.007572  L
 N-N--0.347900(PDBName=N,ResName=ARG,ResNum=107)              0     28.081676     37.860677     48.147547  L
 H-H-0.274700(PDBName=H,ResName=ARG,ResNum=107)               0     28.056683     38.746264     47.665663  L
 C-CT--0.263700(PDBName=CA,ResName=ARG,ResNum=107)            0     29.052635     36.857392     47.698480  L
 H-H1-0.156000(PDBName=HA,ResName=ARG,ResNum=107)             0     28.541565     35.901611     47.617517  L
 C-CT--0.000700(PDBName=CB,ResName=ARG,ResNum=107)            0     29.554719     37.255764     46.294706  L
 H-HC-0.032700(PDBName=2HB,ResName=ARG,ResNum=107)            0     28.724423     37.118133     45.599224  L
 H-HC-0.032700(PDBName=3HB,ResName=ARG,ResNum=107)            0     29.820411     38.314754     46.278181  L
 C-CT-0.039000(PDBName=CG,ResName=ARG,ResNum=107)             0     30.744245     36.421283     45.789194  L
 H-HC-0.028500(PDBName=2HG,ResName=ARG,ResNum=107)            0     30.715480     35.440277     46.262437  L
 H-HC-0.028500(PDBName=3HG,ResName=ARG,ResNum=107)            0     30.637151     36.269041     44.714605  L
 C-CT-0.048600(PDBName=CD,ResName=ARG,ResNum=107)             0     32.100985     37.107337     46.035714  L
 H-H1-0.068700(PDBName=2HD,ResName=ARG,ResNum=107)            0     32.435140     37.571597     45.107039  L
 H-H1-0.068700(PDBName=3HD,ResName=ARG,ResNum=107)            0     31.990119     37.901601     46.775695  L
 N-N2--0.529500(PDBName=NE,ResName=ARG,ResNum=107)            0     33.102476     36.157069     46.540446  L
 H-H-0.345600(PDBName=HE,ResName=ARG,ResNum=107)              0     32.898969     35.676613     47.408352  L
 C-CA-0.807600(PDBName=CZ,ResName=ARG,ResNum=107)             0     34.328857     35.917601     46.123755  L
 N-N2--0.862700(PDBName=NH1,ResName=ARG,ResNum=107)           0     35.057409     35.086115     46.794857  L
 H-H-0.447800(PDBName=1HH1,ResName=ARG,ResNum=107)            0     34.736727     34.679051     47.656733  L
 H-H-0.447800(PDBName=2HH1,ResName=ARG,ResNum=107)            0     36.012772     34.887066     46.473275  L
 N-N2--0.862700(PDBName=NH2,ResName=ARG,ResNum=107)           0     34.848322     36.486908     45.079570  L
 H-H-0.447800(PDBName=1HH2,ResName=ARG,ResNum=107)            0     34.372841     37.202349     44.578096  L
 H-H-0.447800(PDBName=2HH2,ResName=ARG,ResNum=107)            0     35.867347     36.385166     44.967351  L
 C-C-0.734100(PDBName=C,ResName=ARG,ResNum=107)               0     30.162714     36.745311     48.764074  L
 O-O--0.589400(PDBName=O,ResName=ARG,ResNum=107)              0     30.849273     37.739634     48.992493  L
 N-N--0.254800(PDBName=N,ResName=PRO,ResNum=108)              0     30.341915     35.593061     49.436037  L
 C-CT-0.019200(PDBName=CD,ResName=PRO,ResNum=108)             0     29.645214     34.334285     49.218962  L
 H-H1-0.039100(PDBName=2HD,ResName=PRO,ResNum=108)            0     29.608803     34.063142     48.164439  L
 H-H1-0.039100(PDBName=3HD,ResName=PRO,ResNum=108)            0     28.635705     34.402271     49.627086  L
 C-CT-0.018900(PDBName=CG,ResName=PRO,ResNum=108)             0     30.439627     33.295050     49.999926  L
 H-HC-0.021300(PDBName=2HG,ResName=PRO,ResNum=108)            0     31.268222     32.920589     49.401046  L
 H-HC-0.021300(PDBName=3HG,ResName=PRO,ResNum=108)            0     29.804655     32.476649     50.309152  L
 C-CT--0.007000(PDBName=CB,ResName=PRO,ResNum=108)            0     30.974192     34.097924     51.183128  L
 H-HC-0.025300(PDBName=2HB,ResName=PRO,ResNum=108)            0     31.860238     33.637767     51.621744  L
 H-HC-0.025300(PDBName=3HB,ResName=PRO,ResNum=108)            0     30.188486     34.203006     51.933277  L
 C-CT--0.026600(PDBName=CA,ResName=PRO,ResNum=108)            0     31.277082     35.463513     50.555403  L
 H-H1-0.064100(PDBName=HA,ResName=PRO,ResNum=108)             0     31.096510     36.250855     51.288224  L
 C-C-0.589600(PDBName=C,ResName=PRO,ResNum=108)               0     32.721211     35.555265     50.056728  L
 O-O--0.574800(PDBName=O,ResName=PRO,ResNum=108)              0     33.068530     34.932841     49.051949  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=109)              0     33.565170     36.333186     50.729902  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=109)               0     33.246347     36.825877     51.552328  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=109)            0     34.949914     36.575627     50.325044  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=109)             0     35.273993     35.773855     49.663166  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=109)            0     35.008331     37.896855     49.530847  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=109)            0     34.169663     37.891508     48.833214  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=109)            0     34.866406     38.743500     50.204457  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=109)             0     36.300421     38.090133     48.709360  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=109)            0     36.588720     37.137174     48.268145  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=109)           0     36.042768     39.081857     47.573465  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=109)           0     35.233078     38.723885     46.941294  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=109)           0     35.784686     40.060172     47.979198  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=109)           0     36.939447     39.169632     46.957657  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=109)           0     37.467637     38.640876     49.531390  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=109)           0     37.789013     37.918562     50.275877  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=109)           0     38.317379     38.837116     48.877224  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=109)           0     37.177780     39.566640     50.028226  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=109)               0     35.856817     36.557702     51.557363  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=109)              0     35.610499     37.274750     52.524560  L
 N-N--0.415700(PDBName=N,ResName=VAL,ResNum=110)              0     36.887459     35.716667     51.514154  L
 H-H-0.271900(PDBName=H,ResName=VAL,ResNum=110)               0     36.974380     35.132413     50.687800  L
 C-CT--0.087500(PDBName=CA,ResName=VAL,ResNum=110)            0     37.962371     35.613459     52.511842  L
 H-H1-0.096900(PDBName=HA,ResName=VAL,ResNum=110)             0     37.950543     36.509582     53.132985  L
 C-CT-0.298500(PDBName=CB,ResName=VAL,ResNum=110)             0     37.756580     34.390709     53.437681  L
 H-HC--0.029700(PDBName=HB,ResName=VAL,ResNum=110)            0     38.535895     34.410200     54.200233  L
 C-CT--0.319200(PDBName=CG1,ResName=VAL,ResNum=110)           0     36.409835     34.434302     54.167023  L
 H-HC-0.079100(PDBName=1HG1,ResName=VAL,ResNum=110)           0     36.346955     33.595739     54.857528  L
 H-HC-0.079100(PDBName=2HG1,ResName=VAL,ResNum=110)           0     36.321767     35.368228     54.722472  L
 H-HC-0.079100(PDBName=3HG1,ResName=VAL,ResNum=110)           0     35.586841     34.361975     53.456750  L
 C-CT--0.319200(PDBName=CG2,ResName=VAL,ResNum=110)           0     37.853123     33.047234     52.706155  L
 H-HC-0.079100(PDBName=1HG2,ResName=VAL,ResNum=110)           0     38.794553     32.985533     52.166026  L
 H-HC-0.079100(PDBName=2HG2,ResName=VAL,ResNum=110)           0     37.820911     32.232810     53.429357  L
 H-HC-0.079100(PDBName=3HG2,ResName=VAL,ResNum=110)           0     37.027697     32.936352     52.003333  L
 C-C-0.597300(PDBName=C,ResName=VAL,ResNum=110)               0     39.327611     35.574067     51.809837  L
 O-O--0.567900(PDBName=O,ResName=VAL,ResNum=110)              0     39.402290     35.630914     50.583068  L
 N-N--0.415700(PDBName=N,ResName=THR,ResNum=111)              0     40.413799     35.442291     52.570138  L
 H-H-0.271900(PDBName=H,ResName=THR,ResNum=111)               0     40.308525     35.424955     53.573565  L
 C-CT--0.038900(PDBName=CA,ResName=THR,ResNum=111)            0     41.777628     35.235063     52.055169  L
 H-H1-0.100700(PDBName=HA,ResName=THR,ResNum=111)             0     41.732454     34.991142     50.995979  L
 C-CT-0.365400(PDBName=CB,ResName=THR,ResNum=111)             0     42.658702     36.479840     52.224285  L
 H-H1-0.004300(PDBName=HB,ResName=THR,ResNum=111)             0     43.679425     36.225930     51.935138  L
 C-CT--0.243800(PDBName=CG2,ResName=THR,ResNum=111)           0     42.190926     37.648969     51.360463  L
 H-HC-0.064200(PDBName=1HG2,ResName=THR,ResNum=111)           0     42.877838     38.485811     51.484821  L
 H-HC-0.064200(PDBName=2HG2,ResName=THR,ResNum=111)           0     42.177755     37.349692     50.312549  L
 H-HC-0.064200(PDBName=3HG2,ResName=THR,ResNum=111)           0     41.191629     37.964141     51.660277  L
 O-OH--0.676100(PDBName=OG1,ResName=THR,ResNum=111)           0     42.656307     36.899835     53.571514  L
 H-HO-0.410200(PDBName=1HG,ResName=THR,ResNum=111)            0     42.765998     36.113086     54.121039  L
 C-C-0.597300(PDBName=C,ResName=THR,ResNum=111)               0     42.430360     34.069259     52.784617  L
 O-O--0.567900(PDBName=O,ResName=THR,ResNum=111)              0     42.362626     34.012031     54.012400  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=112)              0     43.052267     33.150575     52.047040  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=112)               0     43.137516     33.329221     51.049242  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=112)            0     43.577613     31.872956     52.551669  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=112)             0     43.614008     31.920585     53.641269  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=112)             0     42.647189     30.695720     52.174254  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=112)             0     43.042780     29.791939     52.641629  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=112)           0     41.259657     30.939985     52.785946  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=112)           0     41.358588     31.232675     53.831473  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=112)           0     40.740441     31.727162     52.241283  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=112)           0     40.675303     30.026955     52.728105  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=112)           0     42.494038     30.440725     50.653348  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=112)           0     41.496481     30.049602     50.451945  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=112)           0     42.590458     31.375307     50.099421  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=112)           0     43.486839     29.415328     50.092073  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=112)           0     43.314995     29.312658     49.021768  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=112)           0     44.514923     29.733627     50.248879  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=112)           0     43.331708     28.448286     50.571021  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=112)               0     45.010474     31.645464     52.076669  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=112)              0     45.387454     32.077309     50.985004  L
 N-N--0.347900(PDBName=N,ResName=ARG,ResNum=113)              0     45.825867     30.977244     52.897975  L
 H-H-0.274700(PDBName=H,ResName=ARG,ResNum=113)               0     45.418956     30.630192     53.765262  L
 C-CT--0.263700(PDBName=CA,ResName=ARG,ResNum=113)            0     47.269604     30.800563     52.664572  L
 H-H1-0.156000(PDBName=HA,ResName=ARG,ResNum=113)             0     47.491462     31.093001     51.638770  L
 C-CT--0.000700(PDBName=CB,ResName=ARG,ResNum=113)            0     48.044695     31.728939     53.622791  L
 H-HC-0.032700(PDBName=2HB,ResName=ARG,ResNum=113)            0     47.494287     32.662049     53.747244  L
 H-HC-0.032700(PDBName=3HB,ResName=ARG,ResNum=113)            0     48.108233     31.259137     54.600913  L
 C-CT-0.039000(PDBName=CG,ResName=ARG,ResNum=113)             0     49.456388     32.080047     53.126296  L
 H-HC-0.028500(PDBName=2HG,ResName=ARG,ResNum=113)            0     50.007802     31.174715     52.877214  L
 H-HC-0.028500(PDBName=3HG,ResName=ARG,ResNum=113)            0     49.364890     32.690979     52.229641  L
 C-CT-0.048600(PDBName=CD,ResName=ARG,ResNum=113)             0     50.265148     32.862590     54.165053  L
 H-H1-0.068700(PDBName=2HD,ResName=ARG,ResNum=113)            0     51.164544     33.242376     53.677908  L
 H-H1-0.068700(PDBName=3HD,ResName=ARG,ResNum=113)            0     49.674567     33.710217     54.518594  L
 N-N2--0.529500(PDBName=NE,ResName=ARG,ResNum=113)            0     50.642853     32.000684     55.298758  L
 H-H-0.345600(PDBName=HE,ResName=ARG,ResNum=113)              0     50.169532     31.100840     55.386875  L
 C-CA-0.807600(PDBName=CZ,ResName=ARG,ResNum=113)             0     51.579073     32.189191     56.204431  L
 N-N2--0.862700(PDBName=NH1,ResName=ARG,ResNum=113)           0     51.777707     31.304884     57.137094  L
 H-H-0.447800(PDBName=1HH1,ResName=ARG,ResNum=113)            0     51.206540     30.454833     57.146621  L
 H-H-0.447800(PDBName=2HH1,ResName=ARG,ResNum=113)            0     52.520653     31.401391     57.794635  L
 N-N2--0.862700(PDBName=NH2,ResName=ARG,ResNum=113)           0     52.328339     33.256107     56.204777  L
 H-H-0.447800(PDBName=1HH2,ResName=ARG,ResNum=113)            0     52.180504     33.928135     55.476504  L
 H-H-0.447800(PDBName=2HH2,ResName=ARG,ResNum=113)            0     53.074833     33.350786     56.863823  L
 C-C-0.734100(PDBName=C,ResName=ARG,ResNum=113)               0     47.687829     29.337854     52.809843  L
 O-O--0.589400(PDBName=O,ResName=ARG,ResNum=113)              0     47.055141     28.571790     53.529852  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=114)              0     48.766241     28.940870     52.139038  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=114)               0     49.161919     29.615627     51.491540  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=114)            0     49.434207     27.646947     52.334960  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=114)             0     49.067963     27.194505     53.258914  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=114)             0     49.108410     26.653132     51.187916  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=114)             0     49.434700     27.093091     50.243561  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=114)           0     49.859469     25.322899     51.416445  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=114)           0     49.615802     24.607461     50.633721  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=114)           0     50.936721     25.480887     51.390310  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=114)           0     49.580388     24.897600     52.382075  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=114)           0     47.588032     26.355976     51.106717  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=114)           0     47.310523     25.690636     51.923737  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=114)           0     47.016492     27.274233     51.218880  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=114)           0     47.125094     25.745244     49.779807  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=114)           0     46.057245     25.531693     49.831846  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=114)           0     47.294112     26.459592     48.976709  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=114)           0     47.658119     24.821859     49.566686  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=114)               0     50.931000     27.917722     52.537003  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=114)              0     51.721336     27.956325     51.590968  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=115)              0     51.323172     28.178180     53.787878  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=115)               0     50.589405     28.338236     54.477676  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=115)            0     52.707251     28.411582     54.219676  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=115)            0     52.771571     28.245121     55.294738  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=115)            0     53.371876     27.705019     53.722238  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=115)               0     53.208038     29.829830     53.933461  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=115)              0     53.754684     30.489083     54.812662  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=116)              0     53.028078     30.287415     52.695081  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=116)               0     52.554296     29.640404     52.074627  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=116)            0     53.432291     31.605811     52.201520  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=116)            0     53.384059     32.333509     53.012286  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=116)            0     54.460304     31.562929     51.842022  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=116)               0     52.533716     32.091625     51.065537  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=116)              0     51.988558     33.187583     51.139875  L
 N-N--0.415700(PDBName=N,ResName=GLN,ResNum=117)              0     52.361186     31.261703     50.031733  L
 H-H-0.271900(PDBName=H,ResName=GLN,ResNum=117)               0     52.813681     30.364067     50.079245  L
 C-CT--0.003100(PDBName=CA,ResName=GLN,ResNum=117)            0     51.456588     31.513907     48.901882  L
 H-H1-0.085000(PDBName=HA,ResName=GLN,ResNum=117)             0     51.773327     32.432354     48.404667  L
 C-CT--0.003600(PDBName=CB,ResName=GLN,ResNum=117)            0     51.558370     30.353957     47.895676  L
 H-HC-0.017100(PDBName=2HB,ResName=GLN,ResNum=117)            0     51.396680     29.409738     48.419269  L
 H-HC-0.017100(PDBName=3HB,ResName=GLN,ResNum=117)            0     50.781273     30.464965     47.138359  L
 C-CT--0.064500(PDBName=CG,ResName=GLN,ResNum=117)            0     52.926764     30.340579     47.189665  L
 H-HC-0.035200(PDBName=2HG,ResName=GLN,ResNum=117)            0     52.992043     31.201625     46.523560  L
 H-HC-0.035200(PDBName=3HG,ResName=GLN,ResNum=117)            0     53.729564     30.421299     47.921936  L
 C-C-0.695100(PDBName=CD,ResName=GLN,ResNum=117)              0     53.164752     29.072219     46.379548  L
 O-O--0.608600(PDBName=OE1,ResName=GLN,ResNum=117)            0     53.146623     29.063274     45.160046  L
 N-N--0.940700(PDBName=NE2,ResName=GLN,ResNum=117)            0     53.420600     27.958531     47.029580  L
 H-H-0.425100(PDBName=1HE2,ResName=GLN,ResNum=117)            0     53.692001     27.181671     46.433798  L
 H-H-0.425100(PDBName=2HE2,ResName=GLN,ResNum=117)            0     53.462595     27.911512     48.027964  L
 C-C-0.597300(PDBName=C,ResName=GLN,ResNum=117)               0     50.010547     31.719292     49.388353  L
 O-O--0.567900(PDBName=O,ResName=GLN,ResNum=117)              0     49.521291     30.955438     50.222123  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=118)              0     49.361821     32.771801     48.885837  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=118)               0     49.812261     33.291264     48.147618  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=118)            0     48.126731     33.386408     49.385102  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=118)             0     47.668165     32.749007     50.139264  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=118)            0     48.523997     34.743587     50.010261  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=118)            0     49.305132     34.584400     50.754781  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=118)            0     48.958471     35.352445     49.215172  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=118)             0     47.380935     35.552316     50.657486  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=118)            0     46.503185     35.546682     50.013466  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=118)           0     47.003706     34.999786     52.030409  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=118)           0     46.171920     35.573637     52.439757  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=118)           0     46.691940     33.965933     51.933369  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=118)           0     47.853100     35.061254     52.709299  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=118)           0     47.815698     37.004288     50.855765  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=118)           0     48.700809     37.052926     51.489824  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=118)           0     48.040461     37.454767     49.888616  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=118)           0     47.007213     37.571194     51.318462  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=118)               0     47.141573     33.588282     48.222091  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=118)              0     47.574364     33.965987     47.133256  L
 N-N--0.347900(PDBName=N,ResName=LYS,ResNum=119)              0     45.841553     33.371426     48.454495  L
 H-H-0.274700(PDBName=H,ResName=LYS,ResNum=119)               0     45.582685     33.046690     49.383530  L
 C-CT--0.240000(PDBName=CA,ResName=LYS,ResNum=119)            0     44.737583     33.617005     47.506965  L
 H-H1-0.142600(PDBName=HA,ResName=LYS,ResNum=119)             0     45.071044     34.313913     46.737054  L
 C-CT--0.009400(PDBName=CB,ResName=LYS,ResNum=119)            0     44.295727     32.297595     46.836933  L
 H-HC-0.036200(PDBName=2HB,ResName=LYS,ResNum=119)            0     43.942194     31.616279     47.613212  L
 H-HC-0.036200(PDBName=3HB,ResName=LYS,ResNum=119)            0     43.452194     32.496283     46.174030  L
 C-CT-0.018700(PDBName=CG,ResName=LYS,ResNum=119)             0     45.368873     31.570842     46.015351  L
 H-HC-0.010300(PDBName=2HG,ResName=LYS,ResNum=119)            0     46.219215     31.335204     46.654773  L
 H-HC-0.010300(PDBName=3HG,ResName=LYS,ResNum=119)            0     44.934340     30.631259     45.671202  L
 C-CT--0.047900(PDBName=CD,ResName=LYS,ResNum=119)            0     45.852146     32.353318     44.785833  L
 H-HC-0.062100(PDBName=2HD,ResName=LYS,ResNum=119)            0     44.995326     32.610075     44.163043  L
 H-HC-0.062100(PDBName=3HD,ResName=LYS,ResNum=119)            0     46.351530     33.272321     45.084968  L
 C-CT--0.014300(PDBName=CE,ResName=LYS,ResNum=119)            0     46.821477     31.460902     44.006279  L
 H-HP-0.113500(PDBName=2HE,ResName=LYS,ResNum=119)            0     47.613577     31.121232     44.676805  L
 H-HP-0.113500(PDBName=3HE,ResName=LYS,ResNum=119)            0     46.264216     30.584144     43.679375  L
 N-N3--0.385400(PDBName=NZ,ResName=LYS,ResNum=119)            0     47.407624     32.141320     42.829806  L
 H-H-0.340000(PDBName=1HZ,ResName=LYS,ResNum=119)             0     46.691801     32.668374     42.321938  L
 H-H-0.340000(PDBName=2HZ,ResName=LYS,ResNum=119)             0     48.089734     32.831125     43.094678  L
 H-H-0.340000(PDBName=3HZ,ResName=LYS,ResNum=119)             0     47.808777     31.467160     42.178499  L
 C-C-0.734100(PDBName=C,ResName=LYS,ResNum=119)               0     43.529646     34.258466     48.199764  L
 O-O--0.589400(PDBName=O,ResName=LYS,ResNum=119)              0     43.418722     34.252621     49.425226  L
 N-N--0.516300(PDBName=N,ResName=GLU,ResNum=120)              0     42.608882     34.783934     47.398582  L
 H-H-0.293600(PDBName=H,ResName=GLU,ResNum=120)               0     42.802600     34.695286     46.413675  L
 C-CT-0.039700(PDBName=CA,ResName=GLU,ResNum=120)             0     41.201371     34.999402     47.768819  L
 H-H1-0.110500(PDBName=HA,ResName=GLU,ResNum=120)             0     41.148393     35.566022     48.698541  L
 C-CT-0.056000(PDBName=CB,ResName=GLU,ResNum=120)             0     40.569214     35.823729     46.629126  L
 H-HC--0.017300(PDBName=2HB,ResName=GLU,ResNum=120)           0     41.233629     36.662630     46.413537  L
 H-HC--0.017300(PDBName=3HB,ResName=GLU,ResNum=120)           0     40.523916     35.211624     45.726330  L
 C-CT-0.013600(PDBName=CG,ResName=GLU,ResNum=120)             0     39.185080     36.413736     46.931975  L
 H-HC--0.042500(PDBName=2HG,ResName=GLU,ResNum=120)           0     38.924634     36.245758     47.977522  L
 H-HC--0.042500(PDBName=3HG,ResName=GLU,ResNum=120)           0     39.231399     37.495447     46.787077  L
 C-C-0.805400(PDBName=CD,ResName=GLU,ResNum=120)              0     38.093588     35.830950     46.028680  L
 O-O2--0.818800(PDBName=OE1,ResName=GLU,ResNum=120)           0     37.542482     36.560712     45.179015  L
 O-O2--0.818800(PDBName=OE2,ResName=GLU,ResNum=120)           0     37.691311     34.665300     46.229951  L
 C-C-0.536600(PDBName=C,ResName=GLU,ResNum=120)               0     40.483551     33.641864     47.965249  L
 O-O--0.581900(PDBName=O,ResName=GLU,ResNum=120)              0     41.018526     32.613608     47.551987  L
 N-N--0.415700(PDBName=N,ResName=ALA,ResNum=121)              0     39.287902     33.605957     48.565300  L
 H-H-0.271900(PDBName=H,ResName=ALA,ResNum=121)               0     38.938942     34.467947     48.966247  L
 C-CT-0.033700(PDBName=CA,ResName=ALA,ResNum=121)             0     38.344125     32.496386     48.385761  L
 H-H1-0.082300(PDBName=HA,ResName=ALA,ResNum=121)             0     38.426256     32.162173     47.352024  L
 C-CT--0.182500(PDBName=CB,ResName=ALA,ResNum=121)            0     38.731269     31.322669     49.290535  L
 H-HC-0.060300(PDBName=1HB,ResName=ALA,ResNum=121)            0     39.726839     30.961461     49.034471  L
 H-HC-0.060300(PDBName=2HB,ResName=ALA,ResNum=121)            0     38.713784     31.627438     50.334075  L
 H-HC-0.060300(PDBName=3HB,ResName=ALA,ResNum=121)            0     38.017266     30.514115     49.139855  L
 C-C-0.597300(PDBName=C,ResName=ALA,ResNum=121)               0     36.862479     32.857124     48.616700  L
 O-O--0.567900(PDBName=O,ResName=ALA,ResNum=121)              0     36.502253     33.641624     49.497665  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=122)              0     35.985523     32.189189     47.865006  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=122)               0     36.388099     31.660406     47.097361  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=122)            0     34.560576     31.975232     48.113980  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=122)             0     34.112189     32.887378     48.491070  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=122)            0     33.916977     31.584465     46.766962  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=122)            0     34.214936     32.300435     45.998924  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=122)            0     34.327552     30.618417     46.471511  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=122)             0     32.381012     31.476895     46.787614  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=122)            0     32.035903     31.101249     47.749599  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=122)           0     31.727684     32.828693     46.505914  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=122)           0     32.031307     33.540075     47.265516  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=122)           0     32.035011     33.194730     45.526315  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=122)           0     30.643120     32.721616     46.529959  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=122)           0     31.904342     30.522559     45.699425  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=122)           0     32.317114     30.825919     44.739702  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=122)           0     32.241234     29.512142     45.930958  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=122)           0     30.816972     30.523077     45.648052  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=122)               0     34.366537     30.849372     49.143480  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=122)              0     34.840461     29.736858     48.926638  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=123)              0     33.639672     31.105332     50.235075  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=123)               0     33.283622     32.039736     50.351597  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=123)            0     33.164574     30.042764     51.134703  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=123)             0     33.961606     29.309963     51.278812  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=123)            0     32.771074     30.621571     52.506829  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=123)            0     31.921343     31.292192     52.374063  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=123)            0     32.440999     29.796272     53.140149  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=123)             0     33.885436     31.387912     53.242253  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=123)            0     34.157795     32.272643     52.666002  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=123)           0     33.363979     31.842674     54.603127  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=123)           0     33.231078     30.981088     55.256223  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=123)           0     34.081902     32.524122     55.054821  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=123)           0     32.411045     32.358430     54.490156  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=123)           0     35.135345     30.538059     53.478516  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=123)           0     34.866587     29.598067     53.959849  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=123)           0     35.630046     30.335284     52.529651  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=123)           0     35.830458     31.077710     54.121090  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=123)               0     31.968291     29.320738     50.494310  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=123)              0     30.958217     29.961107     50.189522  L
 N-N--0.415700(PDBName=N,ResName=ASH,ResNum=124)              0     32.080036     28.008564     50.281116  L
 H-H-0.271900(PDBName=H,ResName=ASH,ResNum=124)               0     32.957705     27.558324     50.529823  L
 C-CT-0.034100(PDBName=CA,ResName=ASH,ResNum=124)             0     31.199942     27.223622     49.409340  L H-HC 1972 0.0000
 H-H1-0.086400(PDBName=HA,ResName=ASH,ResNum=124)             0     30.311933     27.804846     49.157546  L
 C-CT--0.031600(PDBName=CB,ResName=ASH,ResNum=124)            0     31.985761     26.955141     48.117317  H
 H-HC-0.048800(PDBName=2HB,ResName=ASH,ResNum=124)            0     32.483700     27.877703     47.807312  H
 H-HC-0.048800(PDBName=3HB,ResName=ASH,ResNum=124)            0     32.784210     26.236119     48.334420  H
 C-C-0.646200(PDBName=CG,ResName=ASH,ResNum=124)              0     31.161378     26.437015     46.972609  H
 O-OH--0.637600(PDBName=OD1,ResName=ASH,ResNum=124)           0     30.046341     25.928390     47.102713  H
 O-OH--0.555400(PDBName=OD2,ResName=ASH,ResNum=124)           0     31.740051     26.597357     45.798519  H
 H-HO-0.474700(PDBName=2HD,ResName=ASH,ResNum=124)            0     31.145974     26.159544     45.072410  H
 C-C-0.597300(PDBName=C,ResName=ASH,ResNum=124)               0     30.749573     25.905595     50.072126  L
 O-O--0.567900(PDBName=O,ResName=ASH,ResNum=124)              0     31.582687     25.167324     50.595510  L
 N-N--0.415700(PDBName=N,ResName=THR,ResNum=125)              0     29.447967     25.591516     50.027079  L
 H-H-0.271900(PDBName=H,ResName=THR,ResNum=125)               0     28.831402     26.205002     49.503168  L
 C-CT--0.038900(PDBName=CA,ResName=THR,ResNum=125)            0     28.901528     24.293888     50.478179  L
 H-H1-0.100700(PDBName=HA,ResName=THR,ResNum=125)             0     29.635464     23.810596     51.120953  L
 C-CT-0.365400(PDBName=CB,ResName=THR,ResNum=125)             0     27.575579     24.404617     51.254539  L
 H-H1-0.004300(PDBName=HB,ResName=THR,ResNum=125)             0     26.745521     24.324047     50.553275  L
 C-CT--0.243800(PDBName=CG2,ResName=THR,ResNum=125)           0     27.463908     23.278878     52.278021  L
 H-HC-0.064200(PDBName=1HG2,ResName=THR,ResNum=125)           0     26.509806     23.344191     52.801807  L
 H-HC-0.064200(PDBName=2HG2,ResName=THR,ResNum=125)           0     27.528462     22.317788     51.773696  L
 H-HC-0.064200(PDBName=3HG2,ResName=THR,ResNum=125)           0     28.282854     23.361640     52.990910  L
 O-OH--0.676100(PDBName=OG1,ResName=THR,ResNum=125)           0     27.396877     25.595145     51.980889  L
 H-HO-0.410200(PDBName=1HG,ResName=THR,ResNum=125)            0     26.472178     25.549838     52.281634  L
 C-C-0.597300(PDBName=C,ResName=THR,ResNum=125)               0     28.621015     23.351165     49.309305  L
 O-O--0.567900(PDBName=O,ResName=THR,ResNum=125)              0     28.728574     22.135924     49.463446  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=126)              0     28.167072     23.904363     48.178771  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=126)               0     28.177129     24.919440     48.132671  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=126)            0     27.849331     23.179442     46.948787  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=126)            0     27.029419     22.488692     47.135758  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=126)            0     27.538809     23.890133     46.184677  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=126)               0     29.044936     22.379071     46.434197  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=126)              0     28.915895     21.188831     46.153590  L
 N-N--0.415700(PDBName=N,ResName=ALA,ResNum=127)              0     30.208867     23.020536     46.345606  L
 H-H-0.271900(PDBName=H,ResName=ALA,ResNum=127)               0     30.204470     24.011768     46.549561  L
 C-CT-0.033700(PDBName=CA,ResName=ALA,ResNum=127)             0     31.495980     22.353546     46.194266  L
 H-H1-0.082300(PDBName=HA,ResName=ALA,ResNum=127)             0     31.422389     21.638807     45.375406  L
 C-CT--0.182500(PDBName=CB,ResName=ALA,ResNum=127)            0     32.562869     23.404447     45.859081  L
 H-HC-0.060300(PDBName=1HB,ResName=ALA,ResNum=127)            0     33.504025     22.904386     45.625854  L
 H-HC-0.060300(PDBName=2HB,ResName=ALA,ResNum=127)            0     32.253085     23.993717     44.996145  L
 H-HC-0.060300(PDBName=3HB,ResName=ALA,ResNum=127)            0     32.720689     24.064464     46.711292  L
 C-C-0.597300(PDBName=C,ResName=ALA,ResNum=127)               0     31.895305     21.600633     47.474043  L
 O-O--0.567900(PDBName=O,ResName=ALA,ResNum=127)              0     31.961435     22.197291     48.550783  L
 N-N--0.516300(PDBName=N,ResName=ASP,ResNum=128)              0     32.237857     20.314623     47.358358  L
 H-H-0.293600(PDBName=H,ResName=ASP,ResNum=128)               0     32.245016     19.967564     46.404059  L
 C-CT-0.038100(PDBName=CA,ResName=ASP,ResNum=128)             0     33.078591     19.650065     48.363028  L
 H-H1-0.088000(PDBName=HA,ResName=ASP,ResNum=128)             0     32.868774     20.071557     49.338234  L
 C-CT--0.030300(PDBName=CB,ResName=ASP,ResNum=128)            0     32.814587     18.136138     48.468304  L
 H-HC--0.012200(PDBName=2HB,ResName=ASP,ResNum=128)           0     32.584958     17.732252     47.480186  L
 H-HC--0.012200(PDBName=3HB,ResName=ASP,ResNum=128)           0     33.724827     17.647090     48.819964  L
 C-C-0.799400(PDBName=CG,ResName=ASP,ResNum=128)              0     31.692556     17.790014     49.463798  L
 O-O2--0.801400(PDBName=OD1,ResName=ASP,ResNum=128)           0     30.604147     17.373951     49.003995  L
 O-O2--0.801400(PDBName=OD2,ResName=ASP,ResNum=128)           0     31.899184     17.893317     50.696310  L
 C-C-0.536600(PDBName=C,ResName=ASP,ResNum=128)               0     34.556358     19.971897     48.110315  L
 O-O--0.581900(PDBName=O,ResName=ASP,ResNum=128)              0     35.248430     20.368493     49.043443  L
 N-N--0.516300(PDBName=N,ResName=ASP,ResNum=129)              0     35.053151     19.840966     46.878997  L
 H-H-0.293600(PDBName=H,ResName=ASP,ResNum=129)               0     34.405943     19.668257     46.114421  L
 C-CT-0.038100(PDBName=CA,ResName=ASP,ResNum=129)             0     36.427235     20.197863     46.522866  L
 H-H1-0.088000(PDBName=HA,ResName=ASP,ResNum=129)             0     37.111522     19.659713     47.179615  L
 C-CT--0.030300(PDBName=CB,ResName=ASP,ResNum=129)            0     36.744767     19.784436     45.077323  L
 H-HC--0.012200(PDBName=2HB,ResName=ASP,ResNum=129)           0     35.968933     20.143983     44.404356  L
 H-HC--0.012200(PDBName=3HB,ResName=ASP,ResNum=129)           0     37.666250     20.287572     44.785641  L
 C-C-0.799400(PDBName=CG,ResName=ASP,ResNum=129)              0     36.954048     18.281890     44.880493  L
 O-O2--0.801400(PDBName=OD1,ResName=ASP,ResNum=129)           0     38.118161     17.826246     44.967404  L
 O-O2--0.801400(PDBName=OD2,ResName=ASP,ResNum=129)           0     36.015043     17.556824     44.474888  L
 C-C-0.536600(PDBName=C,ResName=ASP,ResNum=129)               0     36.695425     21.706637     46.688441  L
 O-O--0.581900(PDBName=O,ResName=ASP,ResNum=129)              0     36.230018     22.536384     45.908821  L
 N-N--0.415700(PDBName=N,ResName=THR,ResNum=130)              0     37.535883     22.065395     47.661294  L
 H-H-0.271900(PDBName=H,ResName=THR,ResNum=130)               0     37.761047     21.362081     48.352107  L
 C-CT--0.038900(PDBName=CA,ResName=THR,ResNum=130)            0     38.295635     23.326715     47.635303  L
 H-H1-0.100700(PDBName=HA,ResName=THR,ResNum=130)             0     37.608667     24.168893     47.676082  L
 C-CT-0.365400(PDBName=CB,ResName=THR,ResNum=130)             0     39.246840     23.384920     48.838826  L
 H-H1-0.004300(PDBName=HB,ResName=THR,ResNum=130)             0     39.824062     22.460220     48.884878  L
 C-CT--0.243800(PDBName=CG2,ResName=THR,ResNum=130)           0     40.229084     24.557301     48.824120  L
 H-HC-0.064200(PDBName=1HG2,ResName=THR,ResNum=130)           0     40.819900     24.552109     49.736320  L
 H-HC-0.064200(PDBName=2HG2,ResName=THR,ResNum=130)           0     40.903279     24.478852     47.973747  L
 H-HC-0.064200(PDBName=3HG2,ResName=THR,ResNum=130)           0     39.697925     25.499540     48.762205  L
 O-OH--0.676100(PDBName=OG1,ResName=THR,ResNum=130)           0     38.472979     23.491038     50.010089  L
 H-HO-0.410200(PDBName=1HG,ResName=THR,ResNum=130)            0     38.121190     22.600292     50.196649  L
 C-C-0.597300(PDBName=C,ResName=THR,ResNum=130)               0     39.088637     23.416045     46.332237  L
 O-O--0.567900(PDBName=O,ResName=THR,ResNum=130)              0     39.967419     22.585823     46.110786  L
 N-N--0.415700(PDBName=N,ResName=VAL,ResNum=131)              0     38.806041     24.403801     45.479611  L
 H-H-0.271900(PDBName=H,ResName=VAL,ResNum=131)               0     38.132736     25.098473     45.782142  L
 C-CT--0.087500(PDBName=CA,ResName=VAL,ResNum=131)            0     39.403221     24.567552     44.145011  L
 H-H1-0.096900(PDBName=HA,ResName=VAL,ResNum=131)             0     40.315759     23.979813     44.127383  L
 C-CT-0.298500(PDBName=CB,ResName=VAL,ResNum=131)             0     38.498309     23.999352     43.033378  L
 H-HC--0.029700(PDBName=HB,ResName=VAL,ResNum=131)            0     38.411938     22.929196     43.211172  L
 C-CT--0.319200(PDBName=CG1,ResName=VAL,ResNum=131)           0     37.078336     24.564369     43.002846  L
 H-HC-0.079100(PDBName=1HG1,ResName=VAL,ResNum=131)           0     37.105597     25.623093     42.751494  L
 H-HC-0.079100(PDBName=2HG1,ResName=VAL,ResNum=131)           0     36.493109     24.030466     42.256485  L
 H-HC-0.079100(PDBName=3HG1,ResName=VAL,ResNum=131)           0     36.594186     24.425168     43.969341  L
 C-CT--0.319200(PDBName=CG2,ResName=VAL,ResNum=131)           0     39.121168     24.200062     41.642247  L
 H-HC-0.079100(PDBName=1HG2,ResName=VAL,ResNum=131)           0     40.163143     23.886018     41.635393  L
 H-HC-0.079100(PDBName=2HG2,ResName=VAL,ResNum=131)           0     38.571842     23.613250     40.909163  L
 H-HC-0.079100(PDBName=3HG2,ResName=VAL,ResNum=131)           0     39.070603     25.250870     41.354014  L
 C-C-0.597300(PDBName=C,ResName=VAL,ResNum=131)               0     39.820768     26.011930     43.891533  L
 O-O--0.567900(PDBName=O,ResName=VAL,ResNum=131)              0     39.037376     26.948705     44.018005  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=132)              0     41.097109     26.194960     43.570687  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=132)               0     41.682462     25.370479     43.504395  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=132)            0     41.793302     27.471604     43.648097  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=132)             0     41.076209     28.271901     43.829116  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=132)            0     42.773913     27.420380     44.839777  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=132)            0     43.492820     26.626425     44.642721  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=132)            0     43.323950     28.361614     44.888274  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=132)             0     42.124519     27.152916     46.215232  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=132)            0     41.491541     26.267902     46.167006  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=132)           0     43.208294     26.877961     47.257925  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=132)           0     42.742707     26.665409     48.220118  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=132)           0     43.796045     26.012916     46.951372  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=132)           0     43.854433     27.747569     47.351023  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=132)           0     41.283787     28.336207     46.696206  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=132)           0     41.890318     29.241729     46.742759  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=132)           0     40.457548     28.495518     46.008457  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=132)           0     40.869185     28.120795     47.680818  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=132)               0     42.511088     27.811528     42.336664  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=132)              0     42.824056     26.961580     41.505192  L
 N-N--0.516300(PDBName=N,ResName=GLU,ResNum=133)              0     42.787459     29.092760     42.177949  L
 H-H-0.293600(PDBName=H,ResName=GLU,ResNum=133)               0     42.492656     29.706937     42.931813  L
 C-CT-0.039700(PDBName=CA,ResName=GLU,ResNum=133)             0     43.718879     29.681352     41.224123  L
 H-H1-0.110500(PDBName=HA,ResName=GLU,ResNum=133)             0     43.389110     29.490438     40.202823  L
 C-CT-0.056000(PDBName=CB,ResName=GLU,ResNum=133)             0     43.646351     31.173789     41.539407  L
 H-HC--0.017300(PDBName=2HB,ResName=GLU,ResNum=133)           0     42.599306     31.481659     41.501778  L
 H-HC--0.017300(PDBName=3HB,ResName=GLU,ResNum=133)           0     43.995026     31.286726     42.566320  L
 C-CT-0.013600(PDBName=CG,ResName=GLU,ResNum=133)             0     44.433812     32.150960     40.674636  L
 H-HC--0.042500(PDBName=2HG,ResName=GLU,ResNum=133)           0     45.414942     31.725765     40.450125  L
 H-HC--0.042500(PDBName=3HG,ResName=GLU,ResNum=133)           0     43.902890     32.332656     39.737966  L
 C-C-0.805400(PDBName=CD,ResName=GLU,ResNum=133)              0     44.599858     33.449558     41.476464  L
 O-O2--0.818800(PDBName=OE1,ResName=GLU,ResNum=133)           0     43.622716     33.879228     42.132662  L
 O-O2--0.818800(PDBName=OE2,ResName=GLU,ResNum=133)           0     45.765381     33.893801     41.583234  L
 C-C-0.536600(PDBName=C,ResName=GLU,ResNum=133)               0     45.131445     29.105466     41.448076  L
 O-O--0.581900(PDBName=O,ResName=GLU,ResNum=133)              0     45.553173     28.908105     42.590990  L
 N-N--0.516300(PDBName=N,ResName=GLU,ResNum=134)              0     45.870947     28.775835     40.384998  L
 H-H-0.293600(PDBName=H,ResName=GLU,ResNum=134)               0     45.471697     28.900154     39.465366  L
 C-CT-0.039700(PDBName=CA,ResName=GLU,ResNum=134)             0     47.111454     28.004889     40.550438  L
 H-H1-0.110500(PDBName=HA,ResName=GLU,ResNum=134)             0     46.831492     27.194791     41.214369  L
 C-CT-0.056000(PDBName=CB,ResName=GLU,ResNum=134)             0     47.556136     27.343726     39.230691  L
 H-HC--0.017300(PDBName=2HB,ResName=GLU,ResNum=134)           0     46.681055     26.896187     38.764983  L
 H-HC--0.017300(PDBName=3HB,ResName=GLU,ResNum=134)           0     47.961275     28.093543     38.550230  L
 C-CT-0.013600(PDBName=CG,ResName=GLU,ResNum=134)             0     48.602654     26.239849     39.482483  L
 H-HC--0.042500(PDBName=2HG,ResName=GLU,ResNum=134)           0     49.600664     26.682502     39.450025  L
 H-HC--0.042500(PDBName=3HG,ResName=GLU,ResNum=134)           0     48.466492     25.833960     40.486887  L
 C-C-0.805400(PDBName=CD,ResName=GLU,ResNum=134)              0     48.518580     25.064597     38.503476  L
 O-O2--0.818800(PDBName=OE1,ResName=GLU,ResNum=134)           0     47.941969     24.018568     38.872491  L
 O-O2--0.818800(PDBName=OE2,ResName=GLU,ResNum=134)           0     49.137147     25.106552     37.420267  L
 C-C-0.536600(PDBName=C,ResName=GLU,ResNum=134)               0     48.253846     28.737319     41.291421  L
 O-O--0.581900(PDBName=O,ResName=GLU,ResNum=134)              0     48.406679     29.961628     41.260953  L
 N-N--0.415700(PDBName=N,ResName=MET,ResNum=135)              0     49.040607     27.940022     42.016961  L
 H-H-0.271900(PDBName=H,ResName=MET,ResNum=135)               0     48.835520     26.949819     41.978878  L
 C-CT--0.023700(PDBName=CA,ResName=MET,ResNum=135)            0     50.218093     28.276976     42.817278  L
 H-H1-0.088000(PDBName=HA,ResName=MET,ResNum=135)             0     50.835687     28.984598     42.262433  L
 C-CT-0.034200(PDBName=CB,ResName=MET,ResNum=135)             0     49.791548     28.931751     44.145621  L
 H-HC-0.024100(PDBName=2HB,ResName=MET,ResNum=135)            0     50.633361     28.932289     44.833699  L
 H-HC-0.024100(PDBName=3HB,ResName=MET,ResNum=135)            0     49.528697     29.970294     43.944203  L
 C-CT-0.001800(PDBName=CG,ResName=MET,ResNum=135)             0     48.594997     28.268230     44.837804  L
 H-H1-0.044000(PDBName=2HG,ResName=MET,ResNum=135)            0     47.724280     28.340606     44.185182  L
 H-H1-0.044000(PDBName=3HG,ResName=MET,ResNum=135)            0     48.812020     27.213659     45.000712  L
 S-S--0.273700(PDBName=SD,ResName=MET,ResNum=135)             0     48.161080     29.032522     46.420474  L
 C-CT--0.053600(PDBName=CE,ResName=MET,ResNum=135)            0     46.549515     28.241927     46.669294  L
 H-H1-0.068400(PDBName=1HE,ResName=MET,ResNum=135)            0     46.668713     27.160201     46.720658  L
 H-H1-0.068400(PDBName=2HE,ResName=MET,ResNum=135)            0     46.107527     28.603844     47.597960  L
 H-H1-0.068400(PDBName=3HE,ResName=MET,ResNum=135)            0     45.888373     28.484696     45.836184  L
 C-C-0.597300(PDBName=C,ResName=MET,ResNum=135)               0     51.042010     26.993542     43.036628  L
 O-O--0.567900(PDBName=O,ResName=MET,ResNum=135)              0     50.485932     25.893331     43.052926  L
 N-N--0.415700(PDBName=N,ResName=ASN,ResNum=136)              0     52.366714     27.101197     43.169362  L
 H-H-0.271900(PDBName=H,ResName=ASN,ResNum=136)               0     52.759904     28.025642     43.304234  L
 C-CT-0.014300(PDBName=CA,ResName=ASN,ResNum=136)             0     53.269167     25.947143     43.250146  L
 H-H1-0.104800(PDBName=HA,ResName=ASN,ResNum=136)             0     52.891903     25.157509     42.595506  L
 C-CT--0.204100(PDBName=CB,ResName=ASN,ResNum=136)            0     54.654173     26.360558     42.720290  L
 H-HC-0.079700(PDBName=2HB,ResName=ASN,ResNum=136)            0     54.542565     26.800197     41.729090  L
 H-HC-0.079700(PDBName=3HB,ResName=ASN,ResNum=136)            0     55.103064     27.106250     43.376658  L
 C-C-0.713000(PDBName=CG,ResName=ASN,ResNum=136)              0     55.593500     25.173655     42.591587  L
 O-O--0.593100(PDBName=OD1,ResName=ASN,ResNum=136)            0     55.802768     24.630010     41.524418  L
 N-N--0.919100(PDBName=ND2,ResName=ASN,ResNum=136)            0     56.169961     24.713630     43.674725  L
 H-H-0.419600(PDBName=1HD2,ResName=ASN,ResNum=136)            0     56.765930     23.919278     43.536603  L
 H-H-0.419600(PDBName=2HD2,ResName=ASN,ResNum=136)            0     55.915059     25.092576     44.576078  L
 C-C-0.597300(PDBName=C,ResName=ASN,ResNum=136)               0     53.304176     25.383693     44.684181  L
 O-O--0.567900(PDBName=O,ResName=ASN,ResNum=136)              0     54.185628     25.711418     45.484656  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=137)              0     52.313695     24.565139     45.032596  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=137)               0     51.603191     24.389488     44.332096  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=137)            0     52.112956     24.059388     46.392651  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=137)             0     52.242414     24.899435     47.071568  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=137)            0     50.667830     23.537189     46.513302  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=137)            0     50.507056     22.780462     45.750591  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=137)            0     50.546013     23.055075     47.481294  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=137)             0     49.573281     24.607058     46.358424  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=137)            0     49.613488     25.028439     45.357168  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=137)           0     48.197360     23.969178     46.547682  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=137)           0     47.419764     24.724166     46.436712  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=137)           0     48.045538     23.204782     45.785772  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=137)           0     48.119929     23.512669     47.533044  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=137)           0     49.738605     25.737708     47.374525  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=137)           0     49.836471     25.329238     48.377335  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=137)           0     50.612195     26.339812     47.129269  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=137)           0     48.871630     26.390731     47.333866  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=137)               0     53.138234     22.979129     46.818637  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=137)              0     53.704576     22.284492     45.967382  L
 N-N--0.254800(PDBName=N,ResName=PRO,ResNum=138)              0     53.374648     22.806670     48.137171  L
 C-CT-0.019200(PDBName=CD,ResName=PRO,ResNum=138)             0     52.895405     23.660814     49.220632  L
 H-H1-0.039100(PDBName=2HD,ResName=PRO,ResNum=138)            0     51.820455     23.829798     49.160905  L
 H-H1-0.039100(PDBName=3HD,ResName=PRO,ResNum=138)            0     53.426394     24.613263     49.189233  L
 C-CT-0.018900(PDBName=CG,ResName=PRO,ResNum=138)             0     53.228742     22.928984     50.519786  L
 H-HC-0.021300(PDBName=2HG,ResName=PRO,ResNum=138)            0     52.390480     22.291553     50.807271  L
 H-HC-0.021300(PDBName=3HG,ResName=PRO,ResNum=138)            0     53.476475     23.623884     51.322729  L
 C-CT--0.007000(PDBName=CB,ResName=PRO,ResNum=138)            0     54.425177     22.064562     50.123905  L
 H-HC-0.025300(PDBName=2HB,ResName=PRO,ResNum=138)            0     54.550276     21.215511     50.796675  L
 H-HC-0.025300(PDBName=3HB,ResName=PRO,ResNum=138)            0     55.329090     22.676125     50.116767  L
 C-CT--0.026600(PDBName=CA,ResName=PRO,ResNum=138)            0     54.080743     21.646074     48.689049  L
 H-H1-0.064100(PDBName=HA,ResName=PRO,ResNum=138)             0     54.993682     21.449677     48.126042  L
 C-C-0.589600(PDBName=C,ResName=PRO,ResNum=138)               0     53.188061     20.388606     48.660721  L
 O-O--0.574800(PDBName=O,ResName=PRO,ResNum=138)              0     52.034754     20.451423     48.256149  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=139)              0     53.693954     19.236695     49.111129  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=139)               0     54.658010     19.224402     49.400133  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=139)            0     52.883718     18.021353     49.281391  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=139)            0     53.167122     17.536504     50.214685  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=139)            0     51.826458     18.281541     49.360975  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=139)               0     53.076286     17.014934     48.143975  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=139)              0     54.194684     16.529454     47.949006  L
 N-N--0.347900(PDBName=N,ResName=LYS,ResNum=140)              0     51.994556     16.647578     47.447222  L
 H-H-0.274700(PDBName=H,ResName=LYS,ResNum=140)               0     51.113852     17.065303     47.753176  L
 C-CT--0.240000(PDBName=CA,ResName=LYS,ResNum=140)            0     51.894241     15.707431     46.305209  L
 H-H1-0.142600(PDBName=HA,ResName=LYS,ResNum=140)             0     52.840650     15.671302     45.766887  L
 C-CT--0.009400(PDBName=CB,ResName=LYS,ResNum=140)            0     51.491502     14.300069     46.807729  L
 H-HC-0.036200(PDBName=2HB,ResName=LYS,ResNum=140)            0     50.470753     14.359157     47.190075  L
 H-HC-0.036200(PDBName=3HB,ResName=LYS,ResNum=140)            0     51.480774     13.611707     45.960918  L
 C-CT-0.018700(PDBName=CG,ResName=LYS,ResNum=140)             0     52.358627     13.693773     47.926155  L
 H-HC-0.010300(PDBName=2HG,ResName=LYS,ResNum=140)            0     52.367146     14.374079     48.776845  L
 H-HC-0.010300(PDBName=3HG,ResName=LYS,ResNum=140)            0     51.891373     12.767354     48.262759  L
 C-CT--0.047900(PDBName=CD,ResName=LYS,ResNum=140)            0     53.792339     13.371195     47.471222  L
 H-HC-0.062100(PDBName=2HD,ResName=LYS,ResNum=140)            0     53.760563     12.489558     46.828645  L
 H-HC-0.062100(PDBName=3HD,ResName=LYS,ResNum=140)            0     54.194811     14.191557     46.877368  L
 C-CT--0.014300(PDBName=CE,ResName=LYS,ResNum=140)            0     54.746946     13.096450     48.643551  L
 H-HP-0.113500(PDBName=2HE,ResName=LYS,ResNum=140)            0     54.355494     12.271247     49.245797  L
 H-HP-0.113500(PDBName=3HE,ResName=LYS,ResNum=140)            0     55.706241     12.781998     48.221982  L
 N-N3--0.385400(PDBName=NZ,ResName=LYS,ResNum=140)            0     54.950810     14.301608     49.486796  L
 H-H-0.340000(PDBName=1HZ,ResName=LYS,ResNum=140)             0     55.788896     14.236556     50.043927  L
 H-H-0.340000(PDBName=2HZ,ResName=LYS,ResNum=140)             0     54.991402     15.136313     48.902048  L
 H-H-0.340000(PDBName=3HZ,ResName=LYS,ResNum=140)             0     54.168704     14.442516     50.128835  L
 C-C-0.734100(PDBName=C,ResName=LYS,ResNum=140)               0     50.805596     16.209575     45.342381  L
 O-O--0.589400(PDBName=O,ResName=LYS,ResNum=140)              0     49.892626     16.879244     45.807553  L
 N-N--0.415700(PDBName=N,ResName=TRP,ResNum=141)              0     50.837166     15.881890     44.044863  L
 H-H-0.271900(PDBName=H,ResName=TRP,ResNum=141)               0     51.574652     15.304983     43.672700  L
 C-CT--0.027500(PDBName=CA,ResName=TRP,ResNum=141)            0     49.768273     16.302726     43.117101  L
 H-H1-0.112300(PDBName=HA,ResName=TRP,ResNum=141)             0     48.849374     16.380974     43.697474  L
 C-CT--0.005000(PDBName=CB,ResName=TRP,ResNum=141)            0     50.072716     17.701952     42.559146  L
 H-HC-0.033900(PDBName=2HB,ResName=TRP,ResNum=141)            0     49.194691     18.062879     42.026784  L
 H-HC-0.033900(PDBName=3HB,ResName=TRP,ResNum=141)            0     50.214936     18.370718     43.403325  L
 C-C*--0.141500(PDBName=CG,ResName=TRP,ResNum=141)            0     51.251555     17.851505     41.644598  L
 C-CW--0.163800(PDBName=CD1,ResName=TRP,ResNum=141)           0     52.480632     18.266906     42.024469  L
 H-H4-0.206200(PDBName=HD1,ResName=TRP,ResNum=141)            0     52.756510     18.527245     43.039917  L
 N-NA--0.341800(PDBName=NE1,ResName=TRP,ResNum=141)           0     53.302555     18.360717     40.918114  L
 H-H-0.341200(PDBName=HE1,ResName=TRP,ResNum=141)             0     54.258561     18.687643     40.962292  L
 C-CN-0.138000(PDBName=CE2,ResName=TRP,ResNum=141)            0     52.635910     18.019785     39.762114  L
 C-CA--0.260100(PDBName=CZ2,ResName=TRP,ResNum=141)           0     53.018505     17.982630     38.412887  L
 H-HA-0.157200(PDBName=HZ2,ResName=TRP,ResNum=141)            0     54.032583     18.227579     38.130442  L
 C-CA--0.113400(PDBName=CH2,ResName=TRP,ResNum=141)           0     52.075837     17.599704     37.443313  L
 H-HA-0.141700(PDBName=HH2,ResName=TRP,ResNum=141)            0     52.362511     17.541601     36.400977  L
 C-CA--0.197200(PDBName=CZ3,ResName=TRP,ResNum=141)           0     50.762457     17.281117     37.832949  L
 H-HA-0.144700(PDBName=HZ3,ResName=TRP,ResNum=141)            0     50.042226     16.981762     37.083307  L
 C-CA--0.238700(PDBName=CE3,ResName=TRP,ResNum=141)           0     50.390727     17.325479     39.190792  L
 H-HA-0.170000(PDBName=HE3,ResName=TRP,ResNum=141)            0     49.386343     17.065302     39.484237  L
 C-CB-0.124300(PDBName=CD2,ResName=TRP,ResNum=141)            0     51.317578     17.686449     40.193675  L
 C-C-0.597300(PDBName=C,ResName=TRP,ResNum=141)               0     49.451734     15.310406     41.988749  L
 O-O--0.567900(PDBName=O,ResName=TRP,ResNum=141)              0     50.256994     14.438048     41.668144  L
 N-N--0.347900(PDBName=N,ResName=LYS,ResNum=142)              0     48.255956     15.452405     41.397162  L
 H-H-0.274700(PDBName=H,ResName=LYS,ResNum=142)               0     47.668782     16.192743     41.781551  L
 C-CT--0.240000(PDBName=CA,ResName=LYS,ResNum=142)            0     47.697982     14.673708     40.270728  L
 H-H1-0.142600(PDBName=HA,ResName=LYS,ResNum=142)             0     48.506385     14.456163     39.571344  L
 C-CT--0.009400(PDBName=CB,ResName=LYS,ResNum=142)            0     47.146044     13.337740     40.814912  L
 H-HC-0.036200(PDBName=2HB,ResName=LYS,ResNum=142)            0     46.773912     12.735938     39.987026  L
 H-HC-0.036200(PDBName=3HB,ResName=LYS,ResNum=142)            0     47.965189     12.785131     41.278779  L
 C-CT-0.018700(PDBName=CG,ResName=LYS,ResNum=142)             0     46.015089     13.502439     41.843911  L
 H-HC-0.010300(PDBName=2HG,ResName=LYS,ResNum=142)            0     46.383026     14.051222     42.712085  L
 H-HC-0.010300(PDBName=3HG,ResName=LYS,ResNum=142)            0     45.197308     14.059111     41.386908  L
 C-CT--0.047900(PDBName=CD,ResName=LYS,ResNum=142)            0     45.473605     12.139891     42.294462  L
 H-HC-0.062100(PDBName=2HD,ResName=LYS,ResNum=142)            0     45.053085     11.632570     41.424151  L
 H-HC-0.062100(PDBName=3HD,ResName=LYS,ResNum=142)            0     46.280410     11.524868     42.697607  L
 C-CT--0.014300(PDBName=CE,ResName=LYS,ResNum=142)            0     44.362418     12.312921     43.336606  L
 H-HP-0.113500(PDBName=2HE,ResName=LYS,ResNum=142)            0     43.716301     13.140160     43.023988  L
 H-HP-0.113500(PDBName=3HE,ResName=LYS,ResNum=142)            0     43.749125     11.407951     43.349593  L
 N-N3--0.385400(PDBName=NZ,ResName=LYS,ResNum=142)            0     44.891921     12.565724     44.699679  L
 H-H-0.340000(PDBName=1HZ,ResName=LYS,ResNum=142)             0     44.151554     12.865161     45.327274  L
 H-H-0.340000(PDBName=2HZ,ResName=LYS,ResNum=142)             0     45.364222     11.770181     45.096372  L
 H-H-0.340000(PDBName=3HZ,ResName=LYS,ResNum=142)             0     45.553506     13.348859     44.750135  L
 C-C-0.734100(PDBName=C,ResName=LYS,ResNum=142)               0     46.611347     15.480096     39.518918  L
 O-O--0.589400(PDBName=O,ResName=LYS,ResNum=142)              0     46.086473     16.435650     40.084651  L
 N-N--0.254800(PDBName=N,ResName=PRO,ResNum=143)              0     46.238666     15.158125     38.266077  L
 C-CT-0.019200(PDBName=CD,ResName=PRO,ResNum=143)             0     46.847898     14.161052     37.397141  L
 H-H1-0.039100(PDBName=2HD,ResName=PRO,ResNum=143)            0     46.971452     13.200003     37.893396  L
 H-H1-0.039100(PDBName=3HD,ResName=PRO,ResNum=143)            0     47.814003     14.528639     37.048005  L
 C-CT-0.018900(PDBName=CG,ResName=PRO,ResNum=143)             0     45.893907     14.011826     36.212321  L
 H-HC-0.021300(PDBName=2HG,ResName=PRO,ResNum=143)            0     45.137157     13.260713     36.445274  L
 H-HC-0.021300(PDBName=3HG,ResName=PRO,ResNum=143)            0     46.424675     13.749774     35.296520  L
 C-CT--0.007000(PDBName=CB,ResName=PRO,ResNum=143)            0     45.237918     15.389265     36.116489  L
 H-HC-0.025300(PDBName=2HB,ResName=PRO,ResNum=143)            0     44.267294     15.342301     35.620555  L
 H-HC-0.025300(PDBName=3HB,ResName=PRO,ResNum=143)            0     45.902501     16.070557     35.582752  L
 C-CT--0.026600(PDBName=CA,ResName=PRO,ResNum=143)            0     45.125570     15.832285     37.578665  L
 H-H1-0.064100(PDBName=HA,ResName=PRO,ResNum=143)             0     45.253893     16.913968     37.630323  L
 C-C-0.589600(PDBName=C,ResName=PRO,ResNum=143)               0     43.751207     15.470281     38.180609  L
 O-O--0.574800(PDBName=O,ResName=PRO,ResNum=143)              0     43.572791     14.373216     38.709029  L
 N-N--0.347900(PDBName=N,ResName=LYS,ResNum=144)              0     42.770544     16.379258     38.072977  L
 H-H-0.274700(PDBName=H,ResName=LYS,ResNum=144)               0     43.009437     17.279783     37.659401  L
 C-CT--0.240000(PDBName=CA,ResName=LYS,ResNum=144)            0     41.371079     16.212309     38.516146  L
 H-H1-0.142600(PDBName=HA,ResName=LYS,ResNum=144)             0     41.113214     15.153156     38.485891  L
 C-CT--0.009400(PDBName=CB,ResName=LYS,ResNum=144)            0     41.261753     16.696231     39.979339  L
 H-HC-0.036200(PDBName=2HB,ResName=LYS,ResNum=144)            0     41.861631     16.030773     40.599608  L
 H-HC-0.036200(PDBName=3HB,ResName=LYS,ResNum=144)            0     41.704808     17.692197     40.039575  L
 C-CT-0.018700(PDBName=CG,ResName=LYS,ResNum=144)             0     39.849230     16.789542     40.593635  L
 H-HC-0.010300(PDBName=2HG,ResName=LYS,ResNum=144)            0     39.939505     17.314044     41.539251  L
 H-HC-0.010300(PDBName=3HG,ResName=LYS,ResNum=144)            0     39.218310     17.395979     39.946281  L
 C-CT--0.047900(PDBName=CD,ResName=LYS,ResNum=144)            0     39.153523     15.450738     40.888390  L
 H-HC-0.062100(PDBName=2HD,ResName=LYS,ResNum=144)            0     39.050923     14.900220     39.953029  L
 H-HC-0.062100(PDBName=3HD,ResName=LYS,ResNum=144)            0     39.761159     14.857571     41.574603  L
 C-CT--0.014300(PDBName=CE,ResName=LYS,ResNum=144)            0     37.741843     15.662128     41.476155  L
 H-HP-0.113500(PDBName=2HE,ResName=LYS,ResNum=144)            0     37.227249     16.420042     40.879094  L
 H-HP-0.113500(PDBName=3HE,ResName=LYS,ResNum=144)            0     37.171942     14.736707     41.360766  L
 N-N3--0.385400(PDBName=NZ,ResName=LYS,ResNum=144)            0     37.738110     16.060328     42.908440  L
 H-H-0.340000(PDBName=1HZ,ResName=LYS,ResNum=144)             0     36.813685     16.351810     43.245295  L
 H-H-0.340000(PDBName=2HZ,ResName=LYS,ResNum=144)             0     38.061485     15.341173     43.532847  L
 H-H-0.340000(PDBName=3HZ,ResName=LYS,ResNum=144)             0     38.283654     16.891330     43.121287  L
 C-C-0.734100(PDBName=C,ResName=LYS,ResNum=144)               0     40.415753     16.969917     37.580628  L
 O-O--0.589400(PDBName=O,ResName=LYS,ResNum=144)              0     40.602332     18.154380     37.316395  L
 N-N--0.415700(PDBName=N,ResName=MET,ResNum=145)              0     39.386676     16.285022     37.085935  L
 H-H-0.271900(PDBName=H,ResName=MET,ResNum=145)               0     39.289496     15.331219     37.391496  L
 C-CT--0.023700(PDBName=CA,ResName=MET,ResNum=145)            0     38.182799     16.916553     36.526062  L
 H-H1-0.088000(PDBName=HA,ResName=MET,ResNum=145)             0     38.428901     17.870529     36.056739  L
 C-CT-0.034200(PDBName=CB,ResName=MET,ResNum=145)             0     37.522711     15.988754     35.491850  L
 H-HC-0.024100(PDBName=2HB,ResName=MET,ResNum=145)            0     37.337443     15.016360     35.951216  L
 H-HC-0.024100(PDBName=3HB,ResName=MET,ResNum=145)            0     36.554493     16.403539     35.209934  L
 C-CT-0.001800(PDBName=CG,ResName=MET,ResNum=145)             0     38.352880     15.777399     34.219168  L
 H-H1-0.044000(PDBName=2HG,ResName=MET,ResNum=145)            0     39.280390     15.273660     34.491575  L
 H-H1-0.044000(PDBName=3HG,ResName=MET,ResNum=145)            0     37.795724     15.105224     33.565672  L
 S-S--0.273700(PDBName=SD,ResName=MET,ResNum=145)             0     38.778824     17.262411     33.261601  L
 C-CT--0.053600(PDBName=CE,ResName=MET,ResNum=145)            0     37.132744     17.957183     32.930845  L
 H-H1-0.068400(PDBName=1HE,ResName=MET,ResNum=145)            0     37.229110     18.834012     32.291309  L
 H-H1-0.068400(PDBName=2HE,ResName=MET,ResNum=145)            0     36.507491     17.215697     32.432376  L
 H-H1-0.068400(PDBName=3HE,ResName=MET,ResNum=145)            0     36.658496     18.259937     33.864793  L
 C-C-0.597300(PDBName=C,ResName=MET,ResNum=145)               0     37.175550     17.170223     37.652573  L
 O-O--0.567900(PDBName=O,ResName=MET,ResNum=145)              0     37.098170     16.360156     38.576363  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=146)              0     36.394062     18.243186     37.549444  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=146)               0     36.542168     18.887957     36.777949  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=146)            0     35.225593     18.521923     38.399906  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=146)             0     34.878959     17.593118     38.857887  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=146)             0     35.549774     19.522135     39.534242  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=146)             0     34.594659     19.884253     39.904252  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=146)           0     36.258178     18.821590     40.703087  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=146)           0     37.262492     18.530750     40.408532  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=146)           0     36.306544     19.488067     41.564000  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=146)           0     35.683971     17.941728     40.994955  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=146)           0     36.369065     20.741233     39.061979  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=146)           0     37.416413     20.462824     38.942909  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=146)           0     35.996390     21.057404     38.092420  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=146)           0     36.269757     21.941658     40.010116  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=146)           0     36.841911     22.771720     39.598947  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=146)           0     35.228776     22.251501     40.107027  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=146)           0     36.669774     21.690402     40.991710  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=146)               0     34.065364     19.048817     37.547172  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=146)              0     34.279388     19.846641     36.632661  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=147)              0     32.846689     18.596423     37.825199  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=147)               0     32.742478     17.938600     38.600789  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=147)            0     31.599333     19.098194     37.247656  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=147)            0     31.764715     19.445669     36.232997  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=147)            0     30.879639     18.279869     37.222568  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=147)               0     30.993015     20.239747     38.066884  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=147)              0     31.524907     20.635474     39.101888  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=148)              0     29.857850     20.773246     37.617178  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=148)               0     29.504066     20.453704     36.722740  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=148)            0     29.087106     21.786854     38.343822  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=148)            0     28.781427     21.382773     39.309530  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=148)            0     29.719276     22.655506     38.530388  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=148)               0     27.835793     22.229802     37.582538  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=148)              0     27.367872     21.541212     36.672507  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=149)              0     27.289251     23.397867     37.927183  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=149)               0     27.743433     23.922486     38.669648  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=149)            0     26.131673     24.006474     37.255337  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=149)             0     25.326688     23.272352     37.234404  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=149)             0     25.618467     25.245263     38.033308  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=149)             0     26.425495     25.975844     38.083743  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=149)           0     24.441086     25.924184     37.312097  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=149)           0     24.775993     26.373874     36.377563  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=149)           0     23.667667     25.189267     37.100077  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=149)           0     24.027000     26.713076     37.939295  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=149)           0     25.207992     24.918873     39.487514  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=149)           0     26.079580     24.549126     40.024595  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=149)           0     24.910712     25.844731     39.976951  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=149)           0     24.061871     23.906658     39.649893  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=149)           0     24.320936     22.954422     39.189891  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=149)           0     23.877825     23.741103     40.711896  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=149)           0     23.147272     24.286130     39.195725  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=149)               0     26.479184     24.342124     35.797246  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=149)              0     27.061017     25.384261     35.500475  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=150)              0     26.109987     23.443469     34.882338  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=150)               0     25.764838     22.567436     35.250440  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=150)            0     26.141012     23.648351     33.432186  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=150)            0     25.373375     23.029939     32.968951  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=150)            0     25.898989     24.687745     33.220479  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=150)               0     27.467082     23.340897     32.736522  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=150)              0     27.756091     23.969455     31.720655  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=151)              0     28.249918     22.378344     33.236270  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=151)               0     27.981461     21.925515     34.101049  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=151)            0     29.474904     21.906133     32.577783  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=151)            0     29.209289     21.153077     31.836757  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=151)            0     29.953211     22.736355     32.056645  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=151)               0     30.489185     21.283045     33.541373  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=151)              0     30.114134     20.757185     34.590644  L
 N-N--0.415700(PDBName=N,ResName=PHE,ResNum=152)              0     31.769883     21.338048     33.172447  L
 H-H-0.271900(PDBName=H,ResName=PHE,ResNum=152)               0     32.005132     21.878246     32.350503  L
 C-CT--0.002400(PDBName=CA,ResName=PHE,ResNum=152)            0     32.912581     20.837894     33.939764  L
 H-H1-0.097800(PDBName=HA,ResName=PHE,ResNum=152)             0     32.702662     20.968354     35.001042  L
 C-CT--0.034300(PDBName=CB,ResName=PHE,ResNum=152)            0     33.114750     19.334981     33.655074  L
 H-HC-0.029500(PDBName=2HB,ResName=PHE,ResNum=152)            0     34.062049     19.012920     34.088568  L
 H-HC-0.029500(PDBName=3HB,ResName=PHE,ResNum=152)            0     32.331580     18.786405     34.177922  L
 C-CA-0.011800(PDBName=CG,ResName=PHE,ResNum=152)             0     33.086819     18.916640     32.192578  L
 C-CA--0.125600(PDBName=CD1,ResName=PHE,ResNum=152)           0     34.163921     19.217123     31.336482  L
 H-HA-0.133000(PDBName=HD1,ResName=PHE,ResNum=152)            0     35.014381     19.767075     31.709664  L
 C-CA--0.170400(PDBName=CE1,ResName=PHE,ResNum=152)           0     34.127393     18.826280     29.985836  L
 H-HA-0.143000(PDBName=HE1,ResName=PHE,ResNum=152)            0     34.948048     19.075266     29.329218  L
 C-CA--0.107200(PDBName=CZ,ResName=PHE,ResNum=152)            0     33.015509     18.126141     29.485996  L
 H-HA-0.129700(PDBName=HZ,ResName=PHE,ResNum=152)             0     32.983350     17.828676     28.447228  L
 C-CA--0.170400(PDBName=CE2,ResName=PHE,ResNum=152)           0     31.939604     17.819699     30.337080  L
 H-HA-0.143000(PDBName=HE2,ResName=PHE,ResNum=152)            0     31.082758     17.282822     29.954865  L
 C-CA--0.125600(PDBName=CD2,ResName=PHE,ResNum=152)           0     31.975162     18.215104     31.686278  L
 H-HA-0.133000(PDBName=HD2,ResName=PHE,ResNum=152)            0     31.143320     17.979734     32.335439  L
 C-C-0.597300(PDBName=C,ResName=PHE,ResNum=152)               0     34.193607     21.634707     33.640453  L
 O-O--0.567900(PDBName=O,ResName=PHE,ResNum=152)              0     34.361243     22.173821     32.545884  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=153)              0     35.132480     21.646316     34.590120  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=153)               0     34.926282     21.123226     35.437851  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=153)            0     36.449455     22.292572     34.489159  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=153)             0     36.609821     22.511851     33.434640  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=153)             0     36.433800     23.655665     35.234503  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=153)             0     35.557655     24.204550     34.881930  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=153)           0     36.277245     23.482536     36.749607  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=153)           0     36.232148     24.460465     37.228693  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=153)           0     35.345759     22.959950     36.969883  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=153)           0     37.123053     22.931526     37.159034  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=153)           0     37.655691     24.570815     34.989163  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=153)           0     37.484869     25.513686     35.511618  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=153)           0     38.554884     24.128022     35.416913  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=153)           0     37.908915     24.907376     33.514857  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=153)           0     38.712982     25.641066     33.448913  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=153)           0     38.204557     24.017158     32.961263  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=153)           0     37.006092     25.329484     33.071838  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=153)               0     37.576527     21.320628     34.894748  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=153)              0     37.341871     20.242017     35.448044  L
 N-N--0.347900(PDBName=N,ResName=LYS,ResNum=154)              0     38.815726     21.661973     34.526444  L
 H-H-0.274700(PDBName=H,ResName=LYS,ResNum=154)               0     38.924421     22.598809     34.162883  L
 C-CT--0.240000(PDBName=CA,ResName=LYS,ResNum=154)            0     39.977439     20.765534     34.449377  L
 H-H1-0.142600(PDBName=HA,ResName=LYS,ResNum=154)             0     39.727100     19.804237     34.903256  L
 C-CT--0.009400(PDBName=CB,ResName=LYS,ResNum=154)            0     40.287425     20.541685     32.961351  L
 H-HC-0.036200(PDBName=2HB,ResName=LYS,ResNum=154)            0     39.398977     20.119867     32.488934  L
 H-HC-0.036200(PDBName=3HB,ResName=LYS,ResNum=154)            0     40.494655     21.503859     32.488015  L
 C-CT-0.018700(PDBName=CG,ResName=LYS,ResNum=154)             0     41.477095     19.602588     32.717357  L
 H-HC-0.010300(PDBName=2HG,ResName=LYS,ResNum=154)            0     42.398264     20.082284     33.051495  L
 H-HC-0.010300(PDBName=3HG,ResName=LYS,ResNum=154)            0     41.337911     18.677422     33.277315  L
 C-CT--0.047900(PDBName=CD,ResName=LYS,ResNum=154)            0     41.580107     19.286151     31.219890  L
 H-HC-0.062100(PDBName=2HD,ResName=LYS,ResNum=154)            0     40.652299     18.810599     30.894015  L
 H-HC-0.062100(PDBName=3HD,ResName=LYS,ResNum=154)            0     41.715453     20.219606     30.669349  L
 C-CT--0.014300(PDBName=CE,ResName=LYS,ResNum=154)            0     42.760246     18.348368     30.948411  L
 H-HP-0.113500(PDBName=2HE,ResName=LYS,ResNum=154)            0     43.676104     18.830641     31.305325  L
 H-HP-0.113500(PDBName=3HE,ResName=LYS,ResNum=154)            0     42.613650     17.431610     31.528672  L
 N-N3--0.385400(PDBName=NZ,ResName=LYS,ResNum=154)            0     42.875263     18.029541     29.502404  L
 H-H-0.340000(PDBName=1HZ,ResName=LYS,ResNum=154)             0     42.030436     17.578665     29.173104  L
 H-H-0.340000(PDBName=2HZ,ResName=LYS,ResNum=154)             0     43.015145     18.876121     28.964655  L
 H-H-0.340000(PDBName=3HZ,ResName=LYS,ResNum=154)             0     43.657446     17.409475     29.333452  L
 C-C-0.734100(PDBName=C,ResName=LYS,ResNum=154)               0     41.160072     21.358052     35.212621  L
 O-O--0.589400(PDBName=O,ResName=LYS,ResNum=154)              0     41.725202     22.363546     34.791453  L
 N-N--0.415700(PDBName=N,ResName=VAL,ResNum=155)              0     41.517247     20.729077     36.328513  L
 H-H-0.271900(PDBName=H,ResName=VAL,ResNum=155)               0     41.026776     19.873228     36.567477  L
 C-CT--0.087500(PDBName=CA,ResName=VAL,ResNum=155)            0     42.423277     21.258667     37.359500  L
 H-H1-0.096900(PDBName=HA,ResName=VAL,ResNum=155)             0     43.048051     22.036614     36.919335  L
 C-CT-0.298500(PDBName=CB,ResName=VAL,ResNum=155)             0     41.596387     21.917143     38.496501  L
 H-HC--0.029700(PDBName=HB,ResName=VAL,ResNum=155)            0     42.270933     22.252666     39.279702  L
 C-CT--0.319200(PDBName=CG1,ResName=VAL,ResNum=155)           0     40.830883     23.156205     38.016003  L
 H-HC-0.079100(PDBName=1HG1,ResName=VAL,ResNum=155)           0     40.384000     23.668546     38.868381  L
 H-HC-0.079100(PDBName=2HG1,ResName=VAL,ResNum=155)           0     41.509422     23.849503     37.522070  L
 H-HC-0.079100(PDBName=3HG1,ResName=VAL,ResNum=155)           0     40.036878     22.881844     37.322458  L
 C-CT--0.319200(PDBName=CG2,ResName=VAL,ResNum=155)           0     40.587823     20.958245     39.136906  L
 H-HC-0.079100(PDBName=1HG2,ResName=VAL,ResNum=155)           0     39.842399     20.638083     38.408884  L
 H-HC-0.079100(PDBName=2HG2,ResName=VAL,ResNum=155)           0     41.102736     20.084430     39.532633  L
 H-HC-0.079100(PDBName=3HG2,ResName=VAL,ResNum=155)           0     40.074490     21.471150     39.950301  L
 C-C-0.597300(PDBName=C,ResName=VAL,ResNum=155)               0     43.389372     20.172652     37.874430  L
 O-O--0.567900(PDBName=O,ResName=VAL,ResNum=155)              0     43.486095     19.071863     37.320415  L
 N-N--0.347900(PDBName=N,ResName=ARG,ResNum=156)              0     44.146697     20.482183     38.927549  L
 H-H-0.274700(PDBName=H,ResName=ARG,ResNum=156)               0     44.076005     21.438508     39.272388  L
 C-CT--0.263700(PDBName=CA,ResName=ARG,ResNum=156)            0     45.216483     19.678461     39.524919  L
 H-H1-0.156000(PDBName=HA,ResName=ARG,ResNum=156)             0     45.260728     18.696392     39.058626  L
 C-CT--0.000700(PDBName=CB,ResName=ARG,ResNum=156)            0     46.536977     20.423395     39.261463  L
 H-HC-0.032700(PDBName=2HB,ResName=ARG,ResNum=156)            0     46.613107     20.656637     38.197669  L
 H-HC-0.032700(PDBName=3HB,ResName=ARG,ResNum=156)            0     46.510762     21.370738     39.798202  L
 C-CT-0.039000(PDBName=CG,ResName=ARG,ResNum=156)             0     47.797199     19.652064     39.675720  L
 H-HC-0.028500(PDBName=2HG,ResName=ARG,ResNum=156)            0     47.594961     19.060822     40.568599  L
 H-HC-0.028500(PDBName=3HG,ResName=ARG,ResNum=156)            0     48.078605     18.978808     38.866676  L
 C-CT-0.048600(PDBName=CD,ResName=ARG,ResNum=156)             0     48.958402     20.607191     39.991963  L
 H-H1-0.068700(PDBName=2HD,ResName=ARG,ResNum=156)            0     48.694958     21.165201     40.889801  L
 H-H1-0.068700(PDBName=3HD,ResName=ARG,ResNum=156)            0     49.857355     20.033251     40.215406  L
 N-N2--0.529500(PDBName=NE,ResName=ARG,ResNum=156)            0     49.211742     21.587218     38.920720  L
 H-H-0.345600(PDBName=HE,ResName=ARG,ResNum=156)              0     48.626638     22.430607     38.920139  L
 C-CA-0.807600(PDBName=CZ,ResName=ARG,ResNum=156)             0     50.165497     21.617434     38.014940  L
 N-N2--0.862700(PDBName=NH1,ResName=ARG,ResNum=156)           0     50.284882     22.636130     37.218646  L
 H-H-0.447800(PDBName=1HH1,ResName=ARG,ResNum=156)            0     49.662334     23.449110     37.354578  L
 H-H-0.447800(PDBName=2HH1,ResName=ARG,ResNum=156)            0     51.020990     22.740229     36.556041  L
 N-N2--0.862700(PDBName=NH2,ResName=ARG,ResNum=156)           0     51.022065     20.644180     37.872346  L
 H-H-0.447800(PDBName=1HH2,ResName=ARG,ResNum=156)            0     50.942597     19.829451     38.457495  L
 H-H-0.447800(PDBName=2HH2,ResName=ARG,ResNum=156)            0     51.755703     20.721229     37.199326  L
 C-C-0.734100(PDBName=C,ResName=ARG,ResNum=156)               0     44.940965     19.507627     41.019321  L
 O-O--0.589400(PDBName=O,ResName=ARG,ResNum=156)              0     45.047980     20.459395     41.784354  L
 N-N--0.415700(PDBName=N,ResName=GLN,ResNum=157)              0     44.571421     18.304085     41.444596  L
 H-H-0.271900(PDBName=H,ResName=GLN,ResNum=157)               0     44.664715     17.549179     40.779531  L
 C-CT--0.003100(PDBName=CA,ResName=GLN,ResNum=157)            0     44.485481     17.958267     42.861809  L
 H-H1-0.085000(PDBName=HA,ResName=GLN,ResNum=157)             0     43.875109     18.706739     43.362049  L
 C-CT--0.003600(PDBName=CB,ResName=GLN,ResNum=157)            0     43.811240     16.587976     43.023544  L
 H-HC-0.017100(PDBName=2HB,ResName=GLN,ResNum=157)            0     42.856757     16.617433     42.503966  L
 H-HC-0.017100(PDBName=3HB,ResName=GLN,ResNum=157)            0     44.430426     15.819115     42.567267  L
 C-CT--0.064500(PDBName=CG,ResName=GLN,ResNum=157)            0     43.552186     16.227658     44.495173  L
 H-HC-0.035200(PDBName=2HG,ResName=GLN,ResNum=157)            0     44.505991     16.055946     44.992631  L
 H-HC-0.035200(PDBName=3HG,ResName=GLN,ResNum=157)            0     43.058334     17.062433     44.987511  L
 C-C-0.695100(PDBName=CD,ResName=GLN,ResNum=157)              0     42.666428     14.995570     44.670694  L
 O-O--0.608600(PDBName=OE1,ResName=GLN,ResNum=157)            0     41.892267     14.598805     43.814428  L
 N-N--0.940700(PDBName=NE2,ResName=GLN,ResNum=157)            0     42.772902     14.288499     45.773854  L
 H-H-0.425100(PDBName=1HE2,ResName=GLN,ResNum=157)            0     41.973876     13.710982     45.967749  L
 H-H-0.425100(PDBName=2HE2,ResName=GLN,ResNum=157)            0     43.413044     14.621262     46.509112  L
 C-C-0.597300(PDBName=C,ResName=GLN,ResNum=157)               0     45.877486     17.986094     43.496416  L
 O-O--0.567900(PDBName=O,ResName=GLN,ResNum=157)              0     46.821473     17.412053     42.954063  L
 N-N--0.415700(PDBName=N,ResName=TYR,ResNum=158)              0     45.978645     18.633899     44.650494  L
 H-H-0.271900(PDBName=H,ResName=TYR,ResNum=158)               0     45.138805     19.065026     45.023961  L
 C-CT--0.001400(PDBName=CA,ResName=TYR,ResNum=158)            0     47.162975     18.752786     45.486188  L
 H-H1-0.087600(PDBName=HA,ResName=TYR,ResNum=158)             0     47.952392     18.132855     45.066786  L
 C-CT--0.015200(PDBName=CB,ResName=TYR,ResNum=158)            0     47.653113     20.208365     45.503705  L
 H-HC-0.029500(PDBName=2HB,ResName=TYR,ResNum=158)            0     46.950061     20.845842     44.964548  L
 H-HC-0.029500(PDBName=3HB,ResName=TYR,ResNum=158)            0     47.668462     20.573480     46.529796  L
 C-CA--0.001100(PDBName=CG,ResName=TYR,ResNum=158)            0     49.041830     20.399875     44.927599  L
 C-CA--0.190600(PDBName=CD1,ResName=TYR,ResNum=158)           0     49.210925     21.011120     43.671649  L
 H-HA-0.169900(PDBName=HD1,ResName=TYR,ResNum=158)            0     48.340071     21.274572     43.096528  L
 C-CA--0.234100(PDBName=CE1,ResName=TYR,ResNum=158)           0     50.501293     21.302217     43.186549  L
 H-HA-0.165600(PDBName=HE1,ResName=TYR,ResNum=158)            0     50.645450     21.822871     42.252073  L
 C-C-0.322600(PDBName=CZ,ResName=TYR,ResNum=158)              0     51.628953     20.950079     43.954392  L
 O-OH--0.557900(PDBName=OH,ResName=TYR,ResNum=158)            0     52.873113     21.307829     43.550718  L
 H-HO-0.399200(PDBName=HH,ResName=TYR,ResNum=158)             0     53.368642     21.588232     44.338855  L
 C-CA--0.234100(PDBName=CE2,ResName=TYR,ResNum=158)           0     51.462344     20.266286     45.175457  L
 H-HA-0.165600(PDBName=HE2,ResName=TYR,ResNum=158)            0     52.327635     19.991303     45.756724  L
 C-CA--0.190600(PDBName=CD2,ResName=TYR,ResNum=158)           0     50.170911     20.000458     45.665665  L
 H-HA-0.169900(PDBName=HD2,ResName=TYR,ResNum=158)            0     50.052110     19.508739     46.622353  L
 C-C-0.597300(PDBName=C,ResName=TYR,ResNum=158)               0     46.828113     18.232221     46.887373  L
 O-O--0.567900(PDBName=O,ResName=TYR,ResNum=158)              0     45.910726     18.712644     47.551351  L
 N-N--0.516300(PDBName=N,ResName=ASP,ResNum=159)              0     47.564017     17.219624     47.322313  L
 H-H-0.293600(PDBName=H,ResName=ASP,ResNum=159)               0     48.357888     16.963052     46.745299  L
 C-CT-0.038100(PDBName=CA,ResName=ASP,ResNum=159)             0     47.355989     16.443612     48.540440  L
 H-H1-0.088000(PDBName=HA,ResName=ASP,ResNum=159)             0     46.449557     16.780984     49.045482  L
 C-CT--0.030300(PDBName=CB,ResName=ASP,ResNum=159)            0     47.187347     14.961583     48.169413  L
 H-HC--0.012200(PDBName=2HB,ResName=ASP,ResNum=159)           0     48.135419     14.584035     47.782614  L
 H-HC--0.012200(PDBName=3HB,ResName=ASP,ResNum=159)           0     46.949759     14.398052     49.073106  L
 C-C-0.799400(PDBName=CG,ResName=ASP,ResNum=159)              0     46.091258     14.711156     47.129018  L
 O-O2--0.801400(PDBName=OD1,ResName=ASP,ResNum=159)           0     44.890873     14.810823     47.473687  L
 O-O2--0.801400(PDBName=OD2,ResName=ASP,ResNum=159)           0     46.419556     14.340093     45.977611  L
 C-C-0.536600(PDBName=C,ResName=ASP,ResNum=159)               0     48.548667     16.629109     49.491730  L
 O-O--0.581900(PDBName=O,ResName=ASP,ResNum=159)              0     49.654022     16.956342     49.056533  L
 N-N--0.415700(PDBName=N,ResName=GLN,ResNum=160)              0     48.332600     16.407664     50.792381  L
 H-H-0.271900(PDBName=H,ResName=GLN,ResNum=160)               0     47.365567     16.227826     51.041539  L
 C-CT--0.003100(PDBName=CA,ResName=GLN,ResNum=160)            0     49.263542     16.727940     51.887180  L
 H-H1-0.085000(PDBName=HA,ResName=GLN,ResNum=160)             0     48.795687     16.376805     52.806701  L
 C-CT--0.003600(PDBName=CB,ResName=GLN,ResNum=160)            0     50.573678     15.919490     51.714774  L
 H-HC-0.017100(PDBName=2HB,ResName=GLN,ResNum=160)            0     50.307174     14.892110     51.460028  L
 H-HC-0.017100(PDBName=3HB,ResName=GLN,ResNum=160)            0     51.153892     16.328385     50.890335  L
 C-CT--0.064500(PDBName=CG,ResName=GLN,ResNum=160)            0     51.483741     15.871359     52.949014  L
 H-HC-0.035200(PDBName=2HG,ResName=GLN,ResNum=160)            0     51.873394     16.865988     53.161306  L
 H-HC-0.035200(PDBName=3HG,ResName=GLN,ResNum=160)            0     50.898510     15.536355     53.805834  L
 C-C-0.695100(PDBName=CD,ResName=GLN,ResNum=160)              0     52.668290     14.924974     52.742008  L
 O-O--0.608600(PDBName=OE1,ResName=GLN,ResNum=160)            0     53.301014     14.857877     51.691605  L
 N-N--0.940700(PDBName=NE2,ResName=GLN,ResNum=160)            0     53.023257     14.145047     53.739698  L
 H-H-0.425100(PDBName=1HE2,ResName=GLN,ResNum=160)            0     53.804943     13.535845     53.583437  L
 H-H-0.425100(PDBName=2HE2,ResName=GLN,ResNum=160)            0     52.533412     14.169710     54.617595  L
 C-C-0.597300(PDBName=C,ResName=GLN,ResNum=160)               0     49.423151     18.258539     52.048697  L
 O-O--0.567900(PDBName=O,ResName=GLN,ResNum=160)              0     50.529448     18.794062     52.110006  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=161)              0     48.284056     18.954077     52.169480  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=161)               0     47.426331     18.417437     52.084854  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=161)            0     48.143120     20.419850     52.176184  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=161)             0     49.123262     20.878192     52.066207  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=161)             0     47.282723     20.863203     50.967333  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=161)             0     46.329267     20.332510     51.014836  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=161)           0     46.966507     22.367981     51.023888  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=161)           0     46.275680     22.568120     51.838804  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=161)           0     47.874138     22.947850     51.182340  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=161)           0     46.487870     22.685321     50.097457  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=161)           0     47.915474     20.515829     49.606367  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=161)           0     48.059138     19.438925     49.533724  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=161)           0     47.214129     20.795530     48.823539  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=161)           0     49.250241     21.207233     49.318925  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=161)           0     49.160289     22.288074     49.409790  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=161)           0     50.018948     20.844079     50.000289  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=161)           0     49.540934     20.977662     48.297540  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=161)               0     47.498248     20.911298     53.487622  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=161)              0     46.327125     20.609962     53.715535  L
 N-N--0.254800(PDBName=N,ResName=PRO,ResNum=162)              0     48.217698     21.661813     54.347743  L
 C-CT-0.019200(PDBName=CD,ResName=PRO,ResNum=162)             0     49.674917     21.698020     54.390567  L
 H-H1-0.039100(PDBName=2HD,ResName=PRO,ResNum=162)            0     50.071757     22.312480     53.581169  L
 H-H1-0.039100(PDBName=3HD,ResName=PRO,ResNum=162)            0     50.069534     20.682952     54.318527  L
 C-CT-0.018900(PDBName=CG,ResName=PRO,ResNum=162)             0     50.057460     22.300815     55.745171  L
 H-HC-0.021300(PDBName=2HG,ResName=PRO,ResNum=162)            0     50.341724     23.345432     55.616732  L
 H-HC-0.021300(PDBName=3HG,ResName=PRO,ResNum=162)            0     50.871541     21.745413     56.211833  L
 C-CT--0.007000(PDBName=CB,ResName=PRO,ResNum=162)            0     48.768934     22.196146     56.567596  L
 H-HC-0.025300(PDBName=2HB,ResName=PRO,ResNum=162)            0     48.709173     22.953509     57.344926  L
 H-HC-0.025300(PDBName=3HB,ResName=PRO,ResNum=162)            0     48.705979     21.203294     57.012973  L
 C-CT--0.026600(PDBName=CA,ResName=PRO,ResNum=162)            0     47.664461     22.347857     55.520061  L
 H-H1-0.064100(PDBName=HA,ResName=PRO,ResNum=162)             0     46.769519     21.849010     55.885154  L
 C-C-0.589600(PDBName=C,ResName=PRO,ResNum=162)               0     47.314078     23.826227     55.223813  L
 O-O--0.574800(PDBName=O,ResName=PRO,ResNum=162)              0     48.177710     24.706223     55.290227  L
 N-N--0.415700(PDBName=N,ResName=VAL,ResNum=163)              0     46.047409     24.101705     54.901128  L
 H-H-0.271900(PDBName=H,ResName=VAL,ResNum=163)               0     45.382393     23.335774     54.973408  L
 C-CT--0.087500(PDBName=CA,ResName=VAL,ResNum=163)            0     45.500145     25.431427     54.564222  L
 H-H1-0.096900(PDBName=HA,ResName=VAL,ResNum=163)             0     46.220987     25.944598     53.928772  L
 C-CT-0.298500(PDBName=CB,ResName=VAL,ResNum=163)             0     44.168475     25.326870     53.788548  L
 H-HC--0.029700(PDBName=HB,ResName=VAL,ResNum=163)            0     43.396119     24.924287     54.443146  L
 C-CT--0.319200(PDBName=CG1,ResName=VAL,ResNum=163)           0     43.701479     26.696477     53.269029  L
 H-HC-0.079100(PDBName=1HG1,ResName=VAL,ResNum=163)           0     44.474202     27.146921     52.644783  L
 H-HC-0.079100(PDBName=2HG1,ResName=VAL,ResNum=163)           0     42.789461     26.581154     52.682857  L
 H-HC-0.079100(PDBName=3HG1,ResName=VAL,ResNum=163)           0     43.476315     27.364411     54.100029  L
 C-CT--0.319200(PDBName=CG2,ResName=VAL,ResNum=163)           0     44.299614     24.403067     52.573490  L
 H-HC-0.079100(PDBName=1HG2,ResName=VAL,ResNum=163)           0     45.166830     24.685013     51.980976  L
 H-HC-0.079100(PDBName=2HG2,ResName=VAL,ResNum=163)           0     44.390992     23.369065     52.906238  L
 H-HC-0.079100(PDBName=3HG2,ResName=VAL,ResNum=163)           0     43.414268     24.480798     51.947627  L
 C-C-0.597300(PDBName=C,ResName=VAL,ResNum=163)               0     45.274761     26.288974     55.810039  L
 O-O--0.567900(PDBName=O,ResName=VAL,ResNum=163)              0     44.701202     25.856573     56.805705  L
 N-N--0.516300(PDBName=N,ResName=GLU,ResNum=164)              0     45.702880     27.541613     55.738189  L
 H-H-0.293600(PDBName=H,ResName=GLU,ResNum=164)               0     46.135477     27.834359     54.867192  L
 C-CT-0.039700(PDBName=CA,ResName=GLU,ResNum=164)             0     45.600249     28.565959     56.773202  L
 H-H1-0.110500(PDBName=HA,ResName=GLU,ResNum=164)             0     45.433965     28.097265     57.743677  L
 C-CT-0.056000(PDBName=CB,ResName=GLU,ResNum=164)             0     46.925156     29.344072     56.829129  L
 H-HC--0.017300(PDBName=2HB,ResName=GLU,ResNum=164)           0     47.102728     29.794647     55.857715  L
 H-HC--0.017300(PDBName=3HB,ResName=GLU,ResNum=164)           0     46.853043     30.139213     57.572083  L
 C-CT-0.013600(PDBName=CG,ResName=GLU,ResNum=164)             0     48.097721     28.418359     57.193652  L
 H-HC--0.042500(PDBName=2HG,ResName=GLU,ResNum=164)           0     48.021587     28.175448     58.254847  L
 H-HC--0.042500(PDBName=3HG,ResName=GLU,ResNum=164)           0     48.037238     27.484025     56.636910  L
 C-C-0.805400(PDBName=CD,ResName=GLU,ResNum=164)              0     49.473384     29.010749     56.896256  L
 O-O2--0.818800(PDBName=OE1,ResName=GLU,ResNum=164)           0     50.358754     28.934742     57.778550  L
 O-O2--0.818800(PDBName=OE2,ResName=GLU,ResNum=164)           0     49.745944     29.448214     55.760480  L
 C-C-0.536600(PDBName=C,ResName=GLU,ResNum=164)               0     44.407437     29.476594     56.450279  L
 O-O--0.581900(PDBName=O,ResName=GLU,ResNum=164)              0     44.402336     30.173642     55.432856  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=165)              0     43.371220     29.394736     57.290576  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=165)               0     43.483840     28.789569     58.088094  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=165)            0     42.041196     29.986575     57.070545  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=165)             0     42.175509     30.948443     56.571574  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=165)             0     41.187333     29.090683     56.126284  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=165)             0     41.653033     29.147431     55.141387  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=165)           0     41.170265     27.591516     56.506527  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=165)           0     40.610533     27.427328     57.423642  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=165)           0     40.702604     27.014383     55.709210  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=165)           0     42.182162     27.205007     56.624404  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=165)           0     39.753883     29.666075     55.992337  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=165)           0     39.252599     29.669225     56.958395  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=165)           0     39.826641     30.699953     55.652243  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=165)           0     38.844801     28.909371     55.023545  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=165)           0     38.559573     27.947111     55.449403  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=165)           0     37.941388     29.492736     54.843425  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=165)           0     39.364903     28.749304     54.084374  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=165)               0     41.303455     30.288571     58.386070  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=165)              0     40.764072     31.379143     58.547350  L
 N-N--0.415700(PDBName=N,ResName=ALA,ResNum=166)              0     41.210192     29.304087     59.281313  L
 H-H-0.271900(PDBName=H,ResName=ALA,ResNum=166)               0     41.725043     28.456314     59.113596  L
 C-CT-0.033700(PDBName=CA,ResName=ALA,ResNum=166)             0     40.156410     29.191653     60.290070  L
 H-H1-0.082300(PDBName=HA,ResName=ALA,ResNum=166)             0     39.593454     30.122511     60.363149  L
 C-CT--0.182500(PDBName=CB,ResName=ALA,ResNum=166)            0     39.228181     28.073620     59.793904  L
 H-HC-0.060300(PDBName=1HB,ResName=ALA,ResNum=166)            0     38.792536     28.351455     58.835713  L
 H-HC-0.060300(PDBName=2HB,ResName=ALA,ResNum=166)            0     39.787032     27.144861     59.684266  L
 H-HC-0.060300(PDBName=3HB,ResName=ALA,ResNum=166)            0     38.419636     27.898253     60.500044  L
 C-C-0.597300(PDBName=C,ResName=ALA,ResNum=166)               0     40.692585     28.877287     61.694605  L
 O-O--0.567900(PDBName=O,ResName=ALA,ResNum=166)              0     41.903070     28.760470     61.891661  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=167)              0     39.776871     28.657956     62.647318  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=167)               0     38.807716     28.857883     62.393507  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=167)            0     40.061531     28.093637     63.978385  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=167)            0     40.562476     28.851527     64.580764  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=167)            0     39.120263     27.842057     64.466524  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=167)               0     40.948196     26.833251     63.977105  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=167)              0     41.646120     26.569079     64.952022  L
 N-N--0.415700(PDBName=N,ResName=HIE,ResNum=168)              0     40.946881     26.067224     62.880137  L
 H-H-0.271900(PDBName=H,ResName=HIE,ResNum=168)               0     40.362445     26.384318     62.122475  L
 C-CT--0.058100(PDBName=CA,ResName=HIE,ResNum=168)            0     41.887233     24.978221     62.593953  L
 H-H1-0.136000(PDBName=HA,ResName=HIE,ResNum=168)             0     42.687582     24.997437     63.335742  L
 C-CT--0.007400(PDBName=CB,ResName=HIE,ResNum=168)            0     41.159632     23.628281     62.742634  L
 H-HC-0.036700(PDBName=2HB,ResName=HIE,ResNum=168)            0     41.013532     23.426406     63.804326  L
 H-HC-0.036700(PDBName=3HB,ResName=HIE,ResNum=168)            0     40.173160     23.714632     62.291357  L
 C-CC-0.186800(PDBName=CG,ResName=HIE,ResNum=168)             0     41.862613     22.441440     62.121988  L
 N-NB--0.543200(PDBName=ND1,ResName=HIE,ResNum=168)           0     43.237490     22.203503     62.138760  L
 C-CR-0.163500(PDBName=CE1,ResName=HIE,ResNum=168)            0     43.432646     21.108111     61.388912  L
 H-H5-0.143500(PDBName=HE1,ResName=HIE,ResNum=168)            0     44.402483     20.679055     61.172965  L
 N-NA--0.279500(PDBName=NE2,ResName=HIE,ResNum=168)           0     42.261078     20.649644     60.913756  L
 H-H-0.333900(PDBName=HE2,ResName=HIE,ResNum=168)             0     42.136938     19.867640     60.273080  L
 C-CW--0.220700(PDBName=CD2,ResName=HIE,ResNum=168)           0     41.258312     21.469684     61.379706  L
 H-H4-0.186200(PDBName=HD2,ResName=HIE,ResNum=168)            0     40.199974     21.377890     61.183621  L
 C-C-0.597300(PDBName=C,ResName=HIE,ResNum=168)               0     42.543358     25.183706     61.214403  L
 O-O--0.567900(PDBName=O,ResName=HIE,ResNum=168)              0     41.905273     25.615427     60.249863  L
 N-N--0.347900(PDBName=N,ResName=LYS,ResNum=169)              0     43.842802     24.877146     61.120724  L
 H-H-0.274700(PDBName=H,ResName=LYS,ResNum=169)               0     44.210835     24.399598     61.933217  L
 C-CT--0.240000(PDBName=CA,ResName=LYS,ResNum=169)            0     44.649256     24.875188     59.891353  L
 H-H1-0.142600(PDBName=HA,ResName=LYS,ResNum=169)             0     44.368109     25.737332     59.286018  L
 C-CT--0.009400(PDBName=CB,ResName=LYS,ResNum=169)            0     46.130591     25.024277     60.286928  L
 H-HC-0.036200(PDBName=2HB,ResName=LYS,ResNum=169)            0     46.224409     25.919756     60.904305  L
 H-HC-0.036200(PDBName=3HB,ResName=LYS,ResNum=169)            0     46.434982     24.164925     60.887827  L
 C-CT-0.018700(PDBName=CG,ResName=LYS,ResNum=169)             0     47.079083     25.162244     59.085819  L
 H-HC-0.010300(PDBName=2HG,ResName=LYS,ResNum=169)            0     47.121404     24.218069     58.543928  L
 H-HC-0.010300(PDBName=3HG,ResName=LYS,ResNum=169)            0     46.706084     25.937020     58.418488  L
 C-CT--0.047900(PDBName=CD,ResName=LYS,ResNum=169)            0     48.487757     25.560932     59.545397  L
 H-HC-0.062100(PDBName=2HD,ResName=LYS,ResNum=169)            0     48.439290     26.568340     59.963529  L
 H-HC-0.062100(PDBName=3HD,ResName=LYS,ResNum=169)            0     48.829957     24.873588     60.321230  L
 C-CT--0.014300(PDBName=CE,ResName=LYS,ResNum=169)            0     49.466543     25.520784     58.364517  L
 H-HP-0.113500(PDBName=2HE,ResName=LYS,ResNum=169)            0     49.757463     24.482053     58.194764  L
 H-HP-0.113500(PDBName=3HE,ResName=LYS,ResNum=169)            0     48.951053     25.865318     57.461851  L
 N-N3--0.385400(PDBName=NZ,ResName=LYS,ResNum=169)            0     50.667455     26.357315     58.609888  L
 H-H-0.340000(PDBName=1HZ,ResName=LYS,ResNum=169)             0     51.353237     26.226500     57.881735  L
 H-H-0.340000(PDBName=2HZ,ResName=LYS,ResNum=169)             0     50.427538     27.354450     58.562190  L
 H-H-0.340000(PDBName=3HZ,ResName=LYS,ResNum=169)             0     51.077673     26.172959     59.512734  L
 C-C-0.734100(PDBName=C,ResName=LYS,ResNum=169)               0     44.343381     23.615841     59.062771  L
 O-O--0.589400(PDBName=O,ResName=LYS,ResNum=169)              0     45.078646     22.628770     59.111679  L
 N-N--0.415700(PDBName=N,ResName=ALA,ResNum=170)              0     43.229086     23.665655     58.331825  L
 H-H-0.271900(PDBName=H,ResName=ALA,ResNum=170)               0     42.719661     24.533250     58.412324  L
 C-CT-0.033700(PDBName=CA,ResName=ALA,ResNum=170)             0     42.603288     22.565462     57.597401  L
 H-H1-0.082300(PDBName=HA,ResName=ALA,ResNum=170)             0     42.127557     21.911533     58.328844  L
 C-CT--0.182500(PDBName=CB,ResName=ALA,ResNum=170)            0     41.507665     23.155057     56.699954  L
 H-HC-0.060300(PDBName=1HB,ResName=ALA,ResNum=170)            0     41.953130     23.609775     55.815382  L
 H-HC-0.060300(PDBName=2HB,ResName=ALA,ResNum=170)            0     40.820425     22.364328     56.400780  L
 H-HC-0.060300(PDBName=3HB,ResName=ALA,ResNum=170)            0     40.955862     23.929083     57.224637  L
 C-C-0.597300(PDBName=C,ResName=ALA,ResNum=170)               0     43.607694     21.733739     56.775904  L
 O-O--0.567900(PDBName=O,ResName=ALA,ResNum=170)              0     44.202676     22.234570     55.822553  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=171)              0     43.793200     20.459239     57.124838  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=171)               0     43.195514     20.076779     57.849715  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=171)            0     44.874566     19.610636     56.615356  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=171)             0     45.455817     20.210386     55.924071  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=171)             0     45.851699     19.226893     57.749910  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=171)             0     46.201399     20.160942     58.194060  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=171)           0     45.193841     18.402035     58.872606  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=171)           0     44.290603     18.896162     59.227496  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=171)           0     44.931211     17.406504     58.514005  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=171)           0     45.875302     18.305572     59.716972  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=171)           0     47.081204     18.507734     57.151291  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=171)           0     46.790097     17.522175     56.785203  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=171)           0     47.449363     19.087705     56.303728  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=171)           0     48.241865     18.341364     58.139858  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=171)           0     49.106455     17.934766     57.614751  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=171)           0     48.508784     19.306638     58.570617  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=171)           0     47.964164     17.652459     58.937451  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=171)               0     44.343580     18.424839     55.804416  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=171)              0     43.592780     17.584415     56.295591  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=172)              0     44.727246     18.364606     54.530630  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=172)               0     45.289011     19.137810     54.185051  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=172)            0     44.360147     17.286699     53.617232  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=172)            0     44.898765     16.381327     53.897061  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=172)            0     43.291680     17.083345     53.698256  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=172)               0     44.698818     17.618458     52.168795  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=172)              0     45.830540     17.398405     51.734579  L
 N-N--0.415700(PDBName=N,ResName=THR,ResNum=173)              0     43.713432     18.140399     51.437860  L
 H-H-0.271900(PDBName=H,ResName=THR,ResNum=173)               0     42.850772     18.371478     51.907028  L
 C-CT--0.038900(PDBName=CA,ResName=THR,ResNum=173)            0     43.699429     18.226216     49.970424  L
 H-H1-0.100700(PDBName=HA,ResName=THR,ResNum=173)             0     44.720332     18.236076     49.596611  L
 C-CT-0.365400(PDBName=CB,ResName=THR,ResNum=173)             0     42.973125     16.993936     49.398524  L
 H-H1-0.004300(PDBName=HB,ResName=THR,ResNum=173)             0     42.009682     16.900450     49.901716  L
 C-CT--0.243800(PDBName=CG2,ResName=THR,ResNum=173)           0     42.710930     17.030919     47.895839  L
 H-HC-0.064200(PDBName=1HG2,ResName=THR,ResNum=173)           0     42.027493     17.841419     47.643557  L
 H-HC-0.064200(PDBName=2HG2,ResName=THR,ResNum=173)           0     43.648521     17.165184     47.356601  L
 H-HC-0.064200(PDBName=3HG2,ResName=THR,ResNum=173)           0     42.235283     16.099517     47.600028  L
 O-OH--0.676100(PDBName=OG1,ResName=THR,ResNum=173)           0     43.722112     15.828856     49.662215  L
 H-HO-0.410200(PDBName=1HG,ResName=THR,ResNum=173)            0     44.130072     15.522221     48.824268  L
 C-C-0.597300(PDBName=C,ResName=THR,ResNum=173)               0     42.986905     19.491479     49.493163  L
 O-O--0.567900(PDBName=O,ResName=THR,ResNum=173)              0     41.955101     19.873727     50.049125  L
 N-N--0.415700(PDBName=N,ResName=VAL,ResNum=174)              0     43.495767     20.082215     48.411988  L
 H-H-0.271900(PDBName=H,ResName=VAL,ResNum=174)               0     44.326925     19.657638     48.004786  L
 C-CT--0.087500(PDBName=CA,ResName=VAL,ResNum=174)            0     42.841206     21.115964     47.591429  L
 H-H1-0.096900(PDBName=HA,ResName=VAL,ResNum=174)             0     41.774409     21.133645     47.817907  L
 C-CT-0.298500(PDBName=CB,ResName=VAL,ResNum=174)             0     43.412431     22.525570     47.871809  L
 H-HC--0.029700(PDBName=HB,ResName=VAL,ResNum=174)            0     42.809679     23.248731     47.323309  L
 C-CT--0.319200(PDBName=CG1,ResName=VAL,ResNum=174)           0     43.320261     22.885941     49.358162  L
 H-HC-0.079100(PDBName=1HG1,ResName=VAL,ResNum=174)           0     42.311577     22.686214     49.715752  L
 H-HC-0.079100(PDBName=2HG1,ResName=VAL,ResNum=174)           0     44.022277     22.291799     49.942159  L
 H-HC-0.079100(PDBName=3HG1,ResName=VAL,ResNum=174)           0     43.544534     23.944020     49.492545  L
 C-CT--0.319200(PDBName=CG2,ResName=VAL,ResNum=174)           0     44.869748     22.700951     47.421305  L
 H-HC-0.079100(PDBName=1HG2,ResName=VAL,ResNum=174)           0     45.499853     21.946695     47.886901  L
 H-HC-0.079100(PDBName=2HG2,ResName=VAL,ResNum=174)           0     44.943160     22.607476     46.337754  L
 H-HC-0.079100(PDBName=3HG2,ResName=VAL,ResNum=174)           0     45.224586     23.692921     47.700622  L
 C-C-0.597300(PDBName=C,ResName=VAL,ResNum=174)               0     42.983160     20.768265     46.106250  L
 O-O--0.567900(PDBName=O,ResName=VAL,ResNum=174)              0     43.715965     19.848597     45.745411  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=175)              0     42.334022     21.523449     45.228090  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=175)               0     41.671607     22.203726     45.588863  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=175)            0     42.608629     21.576517     43.796090  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=175)             0     43.358436     20.830295     43.545631  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=175)            0     41.337516     21.292296     42.967604  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=175)            0     40.734626     22.192325     42.971510  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=175)            0     41.647922     21.112858     41.938260  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=175)             0     40.410947     20.146992     43.417271  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=175)            0     39.982542     20.380606     44.390112  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=175)           0     39.279125     19.976288     42.401733  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=175)           0     39.673483     19.685026     41.433098  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=175)           0     38.589064     19.211930     42.749690  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=175)           0     38.725460     20.907300     42.300754  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=175)           0     41.141525     18.814151     43.502363  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=175)           0     41.867249     18.866019     44.305256  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=175)           0     40.435589     18.023933     43.753915  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=175)           0     41.631861     18.603370     42.555526  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=175)               0     43.178840     22.960430     43.454661  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=175)              0     42.800627     23.959489     44.063444  L
 N-N--0.415700(PDBName=N,ResName=VAL,ResNum=176)              0     44.054655     23.027590     42.458686  L
 H-H-0.271900(PDBName=H,ResName=VAL,ResNum=176)               0     44.359008     22.155841     42.038015  L
 C-CT--0.087500(PDBName=CA,ResName=VAL,ResNum=176)            0     44.594538     24.261558     41.869602  L
 H-H1-0.096900(PDBName=HA,ResName=VAL,ResNum=176)             0     43.964249     25.087907     42.175517  L
 C-CT-0.298500(PDBName=CB,ResName=VAL,ResNum=176)             0     46.026920     24.576010     42.343560  L
 H-HC--0.029700(PDBName=HB,ResName=VAL,ResNum=176)            0     46.479495     25.236648     41.613947  L
 C-CT--0.319200(PDBName=CG1,ResName=VAL,ResNum=176)           0     46.031652     25.310071     43.687363  L
 H-HC-0.079100(PDBName=1HG1,ResName=VAL,ResNum=176)           0     45.504093     26.258003     43.580641  L
 H-HC-0.079100(PDBName=2HG1,ResName=VAL,ResNum=176)           0     45.539561     24.704707     44.448841  L
 H-HC-0.079100(PDBName=3HG1,ResName=VAL,ResNum=176)           0     47.056572     25.519781     43.992009  L
 C-CT--0.319200(PDBName=CG2,ResName=VAL,ResNum=176)           0     46.936823     23.355058     42.449149  L
 H-HC-0.079100(PDBName=1HG2,ResName=VAL,ResNum=176)           0     46.954177     22.838447     41.491285  L
 H-HC-0.079100(PDBName=2HG2,ResName=VAL,ResNum=176)           0     47.950218     23.677207     42.690765  L
 H-HC-0.079100(PDBName=3HG2,ResName=VAL,ResNum=176)           0     46.571393     22.684768     43.226402  L
 C-C-0.597300(PDBName=C,ResName=VAL,ResNum=176)               0     44.543126     24.187914     40.343437  L
 O-O--0.567900(PDBName=O,ResName=VAL,ResNum=176)              0     44.616514     23.100279     39.773473  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=177)              0     44.370627     25.320907     39.665891  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=177)               0     44.143060     26.163593     40.188317  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=177)            0     44.337284     25.382236     38.203607  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=177)            0     45.355074     25.385622     37.814848  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=177)            0     43.837168     24.488105     37.836959  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=177)               0     43.595727     26.616383     37.677263  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=177)              0     43.540137     27.640755     38.362211  L
 N-N--0.254800(PDBName=N,ResName=PRO,ResNum=178)              0     43.021629     26.544594     36.462080  L
 C-CT-0.019200(PDBName=CD,ResName=PRO,ResNum=178)             0     43.225454     25.500115     35.462895  L
 H-H1-0.039100(PDBName=2HD,ResName=PRO,ResNum=178)            0     43.026350     24.507463     35.865423  L
 H-H1-0.039100(PDBName=3HD,ResName=PRO,ResNum=178)            0     44.248754     25.554337     35.089066  L
 C-CT-0.018900(PDBName=CG,ResName=PRO,ResNum=178)             0     42.245446     25.794618     34.326355  L
 H-HC-0.021300(PDBName=2HG,ResName=PRO,ResNum=178)            0     41.326505     25.226842     34.478605  L
 H-HC-0.021300(PDBName=3HG,ResName=PRO,ResNum=178)            0     42.676766     25.560098     33.352956  L
 C-CT--0.007000(PDBName=CB,ResName=PRO,ResNum=178)            0     41.963874     27.290825     34.475641  L
 H-HC-0.025300(PDBName=2HB,ResName=PRO,ResNum=178)            0     40.986457     27.561544     34.073504  L
 H-HC-0.025300(PDBName=3HB,ResName=PRO,ResNum=178)            0     42.749354     27.857820     33.973598  L
 C-CT--0.026600(PDBName=CA,ResName=PRO,ResNum=178)            0     42.056031     27.528772     35.986747  L
 H-H1-0.064100(PDBName=HA,ResName=PRO,ResNum=178)             0     42.415757     28.541252     36.174983  L
 C-C-0.589600(PDBName=C,ResName=PRO,ResNum=178)               0     40.701393     27.324930     36.685408  L
 O-O--0.574800(PDBName=O,ResName=PRO,ResNum=178)              0     40.099777     26.256402     36.589964  L
 N-N--0.415700(PDBName=N,ResName=THR,ResNum=179)              0     40.198720     28.357496     37.362643  L
 H-H-0.271900(PDBName=H,ResName=THR,ResNum=179)               0     40.739963     29.208018     37.435637  L
 C-CT--0.038900(PDBName=CA,ResName=THR,ResNum=179)            0     38.865670     28.371131     37.986291  L
 H-H1-0.100700(PDBName=HA,ResName=THR,ResNum=179)             0     38.248006     27.636799     37.474091  L
 C-CT-0.365400(PDBName=CB,ResName=THR,ResNum=179)             0     38.925265     27.943243     39.464537  L
 H-H1-0.004300(PDBName=HB,ResName=THR,ResNum=179)             0     39.256688     26.905362     39.511197  L
 C-CT--0.243800(PDBName=CG2,ResName=THR,ResNum=179)           0     39.849302     28.777081     40.350824  L
 H-HC-0.064200(PDBName=1HG2,ResName=THR,ResNum=179)           0     39.804277     28.401216     41.373093  L
 H-HC-0.064200(PDBName=2HG2,ResName=THR,ResNum=179)           0     40.874937     28.690953     39.993389  L
 H-HC-0.064200(PDBName=3HG2,ResName=THR,ResNum=179)           0     39.553960     29.825414     40.344065  L
 O-OH--0.676100(PDBName=OG1,ResName=THR,ResNum=179)           0     37.629987     28.022429     40.006006  L
 H-HO-0.410200(PDBName=1HG,ResName=THR,ResNum=179)            0     37.696814     28.389707     40.906166  L
 C-C-0.597300(PDBName=C,ResName=THR,ResNum=179)               0     38.211835     29.754530     37.841856  L
 O-O--0.567900(PDBName=O,ResName=THR,ResNum=179)              0     38.911588     30.760356     37.964848  L
 N-N--0.254800(PDBName=N,ResName=PRO,ResNum=180)              0     36.891646     29.850097     37.577536  L
 C-CT-0.019200(PDBName=CD,ResName=PRO,ResNum=180)             0     36.007671     28.746389     37.228194  L
 H-H1-0.039100(PDBName=2HD,ResName=PRO,ResNum=180)            0     36.068268     27.937015     37.954903  L
 H-H1-0.039100(PDBName=3HD,ResName=PRO,ResNum=180)            0     36.263497     28.376897     36.234018  L
 C-CT-0.018900(PDBName=CG,ResName=PRO,ResNum=180)             0     34.598317     29.323049     37.212936  L
 H-HC-0.021300(PDBName=2HG,ResName=PRO,ResNum=180)            0     34.168247     29.219721     38.206534  L
 H-HC-0.021300(PDBName=3HG,ResName=PRO,ResNum=180)            0     33.973192     28.834753     36.465006  L
 C-CT--0.007000(PDBName=CB,ResName=PRO,ResNum=180)            0     34.809134     30.798761     36.885559  L
 H-HC-0.025300(PDBName=2HB,ResName=PRO,ResNum=180)            0     34.008636     31.418673     37.291656  L
 H-HC-0.025300(PDBName=3HB,ResName=PRO,ResNum=180)            0     34.863360     30.920569     35.802687  L
 C-CT--0.026600(PDBName=CA,ResName=PRO,ResNum=180)            0     36.175562     31.127824     37.497280  L
 H-H1-0.064100(PDBName=HA,ResName=PRO,ResNum=180)             0     36.706881     31.786798     36.809360  L
 C-C-0.589600(PDBName=C,ResName=PRO,ResNum=180)               0     36.054312     31.889155     38.833025  L
 O-O--0.574800(PDBName=O,ResName=PRO,ResNum=180)              0     35.694811     33.064078     38.818158  L
 N-N--0.415700(PDBName=N,ResName=VAL,ResNum=181)              0     36.335946     31.257814     39.981050  L
 H-H-0.271900(PDBName=H,ResName=VAL,ResNum=181)               0     36.589052     30.278967     39.920326  L
 C-CT--0.087500(PDBName=CA,ResName=VAL,ResNum=181)            0     36.651656     31.932919     41.258387  L
 H-H1-0.096900(PDBName=HA,ResName=VAL,ResNum=181)             0     37.287822     32.787239     41.024370  L
 C-CT-0.298500(PDBName=CB,ResName=VAL,ResNum=181)             0     35.375979     32.465757     41.958379  L
 H-HC--0.029700(PDBName=HB,ResName=VAL,ResNum=181)            0     34.734175     32.913518     41.200519  L
 C-CT--0.319200(PDBName=CG1,ResName=VAL,ResNum=181)           0     34.545420     31.390652     42.665653  L
 H-HC-0.079100(PDBName=1HG1,ResName=VAL,ResNum=181)           0     34.463309     30.508541     42.033968  L
 H-HC-0.079100(PDBName=2HG1,ResName=VAL,ResNum=181)           0     35.021317     31.105372     43.602420  L
 H-HC-0.079100(PDBName=3HG1,ResName=VAL,ResNum=181)           0     33.553008     31.781622     42.882192  L
 C-CT--0.319200(PDBName=CG2,ResName=VAL,ResNum=181)           0     35.686249     33.574858     42.972332  L
 H-HC-0.079100(PDBName=1HG2,ResName=VAL,ResNum=181)           0     34.755399     33.999898     43.345231  L
 H-HC-0.079100(PDBName=2HG2,ResName=VAL,ResNum=181)           0     36.250409     33.186043     43.821035  L
 H-HC-0.079100(PDBName=3HG2,ResName=VAL,ResNum=181)           0     36.261747     34.367451     42.492792  L
 C-C-0.597300(PDBName=C,ResName=VAL,ResNum=181)               0     37.449498     30.990154     42.168444  L
 O-O--0.567900(PDBName=O,ResName=VAL,ResNum=181)              0     37.318649     29.770754     42.059205  L
 N-N--0.415700(PDBName=N,ResName=ASN,ResNum=182)              0     38.267912     31.527133     43.074278  L
 H-H-0.271900(PDBName=H,ResName=ASN,ResNum=182)               0     38.314719     32.531938     43.136638  L
 C-CT-0.014300(PDBName=CA,ResName=ASN,ResNum=182)             0     38.843324     30.742972     44.169329  L
 H-H1-0.104800(PDBName=HA,ResName=ASN,ResNum=182)             0     39.370580     29.877111     43.763240  L
 C-CT--0.204100(PDBName=CB,ResName=ASN,ResNum=182)            0     39.829469     31.616847     44.957842  L
 H-HC-0.079700(PDBName=2HB,ResName=ASN,ResNum=182)            0     39.373421     32.573825     45.213252  L
 H-HC-0.079700(PDBName=3HB,ResName=ASN,ResNum=182)            0     40.058401     31.092852     45.883556  L
 C-C-0.713000(PDBName=CG,ResName=ASN,ResNum=182)              0     41.155251     31.835535     44.257470  L
 O-O--0.593100(PDBName=OD1,ResName=ASN,ResNum=182)            0     41.963152     30.924787     44.180743  L
 N-N--0.919100(PDBName=ND2,ResName=ASN,ResNum=182)            0     41.406205     33.017882     43.734888  L
 H-H-0.419600(PDBName=1HD2,ResName=ASN,ResNum=182)            0     42.277338     33.167501     43.211825  L
 H-H-0.419600(PDBName=2HD2,ResName=ASN,ResNum=182)            0     40.754006     33.771088     43.821123  L
 C-C-0.597300(PDBName=C,ResName=ASN,ResNum=182)               0     37.725450     30.235771     45.100689  L
 O-O--0.567900(PDBName=O,ResName=ASN,ResNum=182)              0     36.849368     31.007382     45.484058  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=183)              0     37.749576     28.961432     45.489486  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=183)               0     38.449493     28.353541     45.073444  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=183)            0     36.718817     28.286170     46.290875  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=183)             0     36.036305     29.021926     46.714090  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=183)             0     35.895884     27.329234     45.389435  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=183)             0     36.589525     26.742874     44.791304  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=183)           0     35.058312     26.343465     46.222425  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=183)           0     35.700600     25.630678     46.738612  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=183)           0     34.466338     26.893791     46.947425  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=183)           0     34.400963     25.757308     45.583144  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=183)           0     34.990118     28.138245     44.434868  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=183)           0     34.191143     28.612665     45.002016  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=183)           0     35.583020     28.918024     43.965502  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=183)           0     34.381948     27.315403     43.295273  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=183)           0     35.175350     26.799195     42.763780  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=183)           0     33.668555     26.586022     43.674874  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=183)           0     33.872020     27.980103     42.599112  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=183)               0     37.369110     27.529734     47.451035  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=183)              0     38.169090     26.624623     47.230650  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=184)              0     36.964431     27.845008     48.682923  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=184)               0     36.262955     28.576784     48.744327  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=184)            0     37.057474     26.943210     49.837187  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=184)             0     37.886522     26.251794     49.705048  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=184)             0     37.288817     27.729576     51.143616  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=184)             0     36.578471     28.557968     51.160617  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=184)           0     37.021093     26.869674     52.393588  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=184)           0     37.603463     25.948122     52.357184  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=184)           0     37.273137     27.429566     53.291306  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=184)           0     35.965061     26.609943     52.448700  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=184)           0     38.711090     28.334959     51.185357  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=184)           0     38.941245     28.770680     50.216845  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=184)           0     38.710372     29.145452     51.912103  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=184)           0     39.856199     27.368773     51.524844  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=184)           0     39.757385     26.993959     52.542906  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=184)           0     39.855942     26.532623     50.831663  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=184)           0     40.808543     27.890664     51.439817  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=184)               0     35.764108     26.129659     49.875804  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=184)              0     34.681875     26.670681     50.112790  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=185)              0     35.897932     24.832838     49.619055  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=185)               0     36.841742     24.473281     49.546224  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=185)            0     34.811304     23.866712     49.538753  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=185)            0     33.875624     24.373564     49.301028  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=185)            0     35.022201     23.153723     48.741344  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=185)               0     34.629600     23.092211     50.840497  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=185)              0     35.478491     23.093857     51.744755  L
 N-N--0.347900(PDBName=N,ResName=ARG,ResNum=186)              0     33.492994     22.403579     50.931189  L
 H-H-0.274700(PDBName=H,ResName=ARG,ResNum=186)               0     32.867871     22.474118     50.128461  L
 C-CT--0.263700(PDBName=CA,ResName=ARG,ResNum=186)            0     33.040630     21.658154     52.104690  L
 H-H1-0.156000(PDBName=HA,ResName=ARG,ResNum=186)             0     32.902401     22.388926     52.891714  L
 C-CT--0.000700(PDBName=CB,ResName=ARG,ResNum=186)            0     31.649684     21.072765     51.814472  L
 H-HC-0.032700(PDBName=2HB,ResName=ARG,ResNum=186)            0     30.954492     21.894333     51.634241  L
 H-HC-0.032700(PDBName=3HB,ResName=ARG,ResNum=186)            0     31.676625     20.466051     50.917220  L
 C-CT-0.039000(PDBName=CG,ResName=ARG,ResNum=186)             0     31.117235     20.212538     52.958685  L
 H-HC-0.028500(PDBName=2HG,ResName=ARG,ResNum=186)            0     31.795607     19.376443     53.123878  L
 H-HC-0.028500(PDBName=3HG,ResName=ARG,ResNum=186)            0     31.048569     20.806374     53.870871  L
 C-CT-0.048600(PDBName=CD,ResName=ARG,ResNum=186)             0     29.745793     19.643661     52.608718  L
 H-H1-0.068700(PDBName=2HD,ResName=ARG,ResNum=186)            0     29.027513     20.461699     52.550517  L
 H-H1-0.068700(PDBName=3HD,ResName=ARG,ResNum=186)            0     29.788211     19.156233     51.631568  L
 N-N2--0.529500(PDBName=NE,ResName=ARG,ResNum=186)            0     29.334750     18.679656     53.639551  L
 H-H-0.345600(PDBName=HE,ResName=ARG,ResNum=186)              0     28.957967     19.049599     54.505600  L
 C-CA-0.807600(PDBName=CZ,ResName=ARG,ResNum=186)             0     29.717368     17.422873     53.739824  L
 N-N2--0.862700(PDBName=NH1,ResName=ARG,ResNum=186)           0     29.328013     16.732063     54.773487  L
 H-H-0.447800(PDBName=1HH1,ResName=ARG,ResNum=186)            0     28.737410     17.182167     55.470223  L
 H-H-0.447800(PDBName=2HH1,ResName=ARG,ResNum=186)            0     29.677890     15.815455     54.960669  L
 N-N2--0.862700(PDBName=NH2,ResName=ARG,ResNum=186)           0     30.470247     16.834799     52.849313  L
 H-H-0.447800(PDBName=1HH2,ResName=ARG,ResNum=186)            0     30.849497     17.370342     52.055186  L
 H-H-0.447800(PDBName=2HH2,ResName=ARG,ResNum=186)            0     30.775877     15.893937     52.958960  L
 C-C-0.734100(PDBName=C,ResName=ARG,ResNum=186)               0     34.067720     20.656665     52.656061  L
 O-O--0.589400(PDBName=O,ResName=ARG,ResNum=186)              0     34.056491     20.434419     53.867201  L
 N-N--0.415700(PDBName=N,ResName=ASN,ResNum=187)              0     34.974408     20.092909     51.851170  L
 H-H-0.271900(PDBName=H,ResName=ASN,ResNum=187)               0     34.951487     20.355127     50.869939  L
 C-CT-0.014300(PDBName=CA,ResName=ASN,ResNum=187)             0     36.029679     19.173737     52.304016  L
 H-H1-0.104800(PDBName=HA,ResName=ASN,ResNum=187)             0     35.519094     18.298493     52.709732  L
 C-CT--0.204100(PDBName=CB,ResName=ASN,ResNum=187)            0     36.889615     18.680880     51.117795  L
 H-HC-0.079700(PDBName=2HB,ResName=ASN,ResNum=187)            0     37.351247     17.743889     51.425840  L
 H-HC-0.079700(PDBName=3HB,ResName=ASN,ResNum=187)            0     36.251479     18.449348     50.267231  L
 C-C-0.713000(PDBName=CG,ResName=ASN,ResNum=187)              0     38.000299     19.628481     50.664206  L
 O-O--0.593100(PDBName=OD1,ResName=ASN,ResNum=187)            0     37.831753     20.820766     50.455730  L
 N-N--0.919100(PDBName=ND2,ResName=ASN,ResNum=187)            0     39.201176     19.114811     50.526220  L
 H-H-0.419600(PDBName=1HD2,ResName=ASN,ResNum=187)            0     39.961740     19.736971     50.271393  L
 H-H-0.419600(PDBName=2HD2,ResName=ASN,ResNum=187)            0     39.353029     18.134720     50.653498  L
 C-C-0.597300(PDBName=C,ResName=ASN,ResNum=187)               0     36.883192     19.736655     53.458972  L
 O-O--0.567900(PDBName=O,ResName=ASN,ResNum=187)              0     37.172713     19.020724     54.418591  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=188)              0     37.283072     21.009780     53.381742  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=188)               0     37.018650     21.523619     52.545218  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=188)            0     37.994982     21.698120     54.460884  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=188)             0     38.684256     20.996596     54.930369  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=188)            0     38.818213     22.870955     53.906244  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=188)            0     38.142181     23.578724     53.422774  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=188)            0     39.291556     23.382036     54.744827  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=188)             0     39.908159     22.467596     52.893008  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=188)            0     39.433262     22.088589     51.994479  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=188)           0     40.708747     23.711298     52.527414  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=188)           0     40.034483     24.469865     52.132384  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=188)           0     41.228188     24.102861     53.400857  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=188)           0     41.427761     23.452000     51.755271  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=188)           0     40.896239     21.401056     53.377612  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=188)           0     41.622047     21.202649     52.588338  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=188)           0     41.427982     21.742525     54.261771  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=188)           0     40.371003     20.472105     53.591649  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=188)               0     37.029917     22.144619     55.565936  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=188)              0     37.276279     21.840471     56.732789  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=189)              0     35.928671     22.821260     55.204298  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=189)               0     35.818917     22.994642     54.211937  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=189)            0     34.891397     23.319453     56.128861  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=189)             0     35.320669     24.130061     56.711647  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=189)            0     33.699651     23.902859     55.347217  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=189)            0     33.223369     23.095073     54.800409  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=189)            0     32.969491     24.264401     56.066790  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=189)             0     34.029390     25.054876     54.374313  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=189)            0     34.740968     24.707192     53.629629  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=189)           0     32.766123     25.517125     53.651804  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=189)           0     32.284729     24.672026     53.160613  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=189)           0     32.069541     25.976018     54.351841  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=189)           0     33.030658     26.240763     52.880114  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=189)           0     34.622772     26.271354     55.086929  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=189)           0     34.701339     27.105537     54.391230  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=189)           0     33.988663     26.568968     55.921107  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=189)           0     35.622652     26.033960     55.443758  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=189)               0     34.429131     22.250997     57.142076  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=189)              0     34.325310     22.528272     58.335978  L
 N-N--0.415700(PDBName=N,ResName=THR,ResNum=190)              0     34.214012     21.024470     56.655576  L
 H-H-0.271900(PDBName=H,ResName=THR,ResNum=190)               0     34.309880     20.943653     55.649680  L
 C-CT--0.038900(PDBName=CA,ResName=THR,ResNum=190)            0     33.979710     19.779681     57.409492  L
 H-H1-0.100700(PDBName=HA,ResName=THR,ResNum=190)             0     32.958071     19.783899     57.785391  L
 C-CT-0.365400(PDBName=CB,ResName=THR,ResNum=190)             0     34.134798     18.571022     56.461888  L
 H-H1-0.004300(PDBName=HB,ResName=THR,ResNum=190)             0     35.068891     18.680004     55.911623  L
 C-CT--0.243800(PDBName=CG2,ResName=THR,ResNum=190)           0     34.137719     17.182651     57.101336  L
 H-HC-0.064200(PDBName=1HG2,ResName=THR,ResNum=190)           0     33.188816     16.987894     57.588222  L
 H-HC-0.064200(PDBName=2HG2,ResName=THR,ResNum=190)           0     34.283408     16.435223     56.321367  L
 H-HC-0.064200(PDBName=3HG2,ResName=THR,ResNum=190)           0     34.947955     17.087392     57.822602  L
 O-OH--0.676100(PDBName=OG1,ResName=THR,ResNum=190)           0     33.070694     18.570566     55.542999  L
 H-HO-0.410200(PDBName=1HG,ResName=THR,ResNum=190)            0     33.296849     19.230195     54.864876  L
 C-C-0.597300(PDBName=C,ResName=THR,ResNum=190)               0     34.902742     19.650279     58.623740  L
 O-O--0.567900(PDBName=O,ResName=THR,ResNum=190)              0     34.424581     19.619833     59.756153  L
 N-N--0.415700(PDBName=N,ResName=GLN,ResNum=191)              0     36.218389     19.544331     58.402454  L
 H-H-0.271900(PDBName=H,ResName=GLN,ResNum=191)               0     36.552505     19.689296     57.459356  L
 C-CT--0.003100(PDBName=CA,ResName=GLN,ResNum=191)            0     37.187709     19.239925     59.462174  L
 H-H1-0.085000(PDBName=HA,ResName=GLN,ResNum=191)             0     36.750831     18.463430     60.093067  L
 C-CT--0.003600(PDBName=CB,ResName=GLN,ResNum=191)            0     38.482479     18.653586     58.880709  L
 H-HC-0.017100(PDBName=2HB,ResName=GLN,ResNum=191)            0     39.131179     18.386698     59.717135  L
 H-HC-0.017100(PDBName=3HB,ResName=GLN,ResNum=191)            0     38.245597     17.735286     58.341156  L
 C-CT--0.064500(PDBName=CG,ResName=GLN,ResNum=191)            0     39.252919     19.592612     57.942564  L
 H-HC-0.035200(PDBName=2HG,ResName=GLN,ResNum=191)            0     38.727129     19.673127     56.991899  L
 H-HC-0.035200(PDBName=3HG,ResName=GLN,ResNum=191)            0     39.339721     20.584156     58.383570  L
 C-C-0.695100(PDBName=CD,ResName=GLN,ResNum=191)              0     40.658331     19.070004     57.706120  L
 O-O--0.608600(PDBName=OE1,ResName=GLN,ResNum=191)            0     41.573680     19.327883     58.474383  L
 N-N--0.940700(PDBName=NE2,ResName=GLN,ResNum=191)            0     40.884159     18.327469     56.648366  L
 H-H-0.425100(PDBName=1HE2,ResName=GLN,ResNum=191)            0     41.830444     17.958774     56.579350  L
 H-H-0.425100(PDBName=2HE2,ResName=GLN,ResNum=191)            0     40.151136     18.074004     56.011677  L
 C-C-0.597300(PDBName=C,ResName=GLN,ResNum=191)               0     37.484977     20.414266     60.405100  L
 O-O--0.567900(PDBName=O,ResName=GLN,ResNum=191)              0     37.822381     20.182009     61.560577  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=192)              0     37.386814     21.665493     59.939881  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=192)               0     37.133291     21.795694     58.967078  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=192)            0     37.554624     22.848647     60.808370  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=192)             0     38.366895     22.645152     61.503604  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=192)             0     37.952060     24.108963     60.006232  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=192)             0     38.090089     24.930543     60.711852  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=192)           0     39.290605     23.868910     59.296368  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=192)           0     39.166905     23.140622     58.495615  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=192)           0     39.661825     24.806012     58.886102  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=192)           0     40.033883     23.504405     59.999108  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=192)           0     36.876719     24.516126     58.983101  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=192)           0     36.847429     23.773546     58.195904  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=192)           0     35.907065     24.530354     59.470861  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=192)           0     37.087085     25.892160     58.347826  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=192)           0     38.049855     25.951468     57.842430  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=192)           0     36.304619     26.077514     57.616471  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=192)           0     37.016455     26.651582     59.122335  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=192)               0     36.335126     23.127473     61.701124  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=192)              0     36.391666     24.023704     62.536284  L
 N-N--0.415700(PDBName=N,ResName=GLY,ResNum=193)              0     35.226836     22.400802     61.515129  L
 H-H-0.271900(PDBName=H,ResName=GLY,ResNum=193)               0     35.250260     21.672645     60.814559  L
 C-CT--0.025200(PDBName=CA,ResName=GLY,ResNum=193)            0     33.970450     22.639796     62.227228  L
 H-H1-0.069800(PDBName=2HA,ResName=GLY,ResNum=193)            0     33.274542     21.831629     62.007599  L
 H-H1-0.069800(PDBName=3HA,ResName=GLY,ResNum=193)            0     34.162466     22.651734     63.300711  L
 C-C-0.597300(PDBName=C,ResName=GLY,ResNum=193)               0     33.302736     23.964898     61.847815  L
 O-O--0.567900(PDBName=O,ResName=GLY,ResNum=193)              0     32.562042     24.530888     62.650465  L
 N-N--0.415700(PDBName=N,ResName=ALA,ResNum=194)              0     33.513474     24.436585     60.614690  L
 H-H-0.271900(PDBName=H,ResName=ALA,ResNum=194)               0     34.053237     23.860276     59.982711  L
 C-CT-0.033700(PDBName=CA,ResName=ALA,ResNum=194)             0     32.801850     25.589564     60.076035  L
 H-H1-0.082300(PDBName=HA,ResName=ALA,ResNum=194)             0     32.916818     26.420642     60.773975  L
 C-CT--0.182500(PDBName=CB,ResName=ALA,ResNum=194)            0     33.410303     25.998139     58.734514  L
 H-HC-0.060300(PDBName=1HB,ResName=ALA,ResNum=194)            0     32.793021     26.764918     58.265177  L
 H-HC-0.060300(PDBName=2HB,ResName=ALA,ResNum=194)            0     34.401053     26.412616     58.905820  L
 H-HC-0.060300(PDBName=3HB,ResName=ALA,ResNum=194)            0     33.473742     25.133772     58.079412  L
 C-C-0.597300(PDBName=C,ResName=ALA,ResNum=194)               0     31.306761     25.272593     59.956993  L
 O-O--0.567900(PDBName=O,ResName=ALA,ResNum=194)              0     30.909770     24.126788     59.719635  L
 N-N--0.415700(PDBName=N,ResName=THR,ResNum=195)              0     30.464371     26.279690     60.165194  L
 H-H-0.271900(PDBName=H,ResName=THR,ResNum=195)               0     30.855875     27.212830     60.258853  L
 C-CT--0.038900(PDBName=CA,ResName=THR,ResNum=195)            0     29.042177     26.064437     60.436475  L
 H-H1-0.100700(PDBName=HA,ResName=THR,ResNum=195)             0     28.752528     25.119973     59.985233  L
 C-CT-0.365400(PDBName=CB,ResName=THR,ResNum=195)             0     28.811359     25.943580     61.950766  L
 H-H1-0.004300(PDBName=HB,ResName=THR,ResNum=195)             0     29.575030     25.281750     62.360243  L
 C-CT--0.243800(PDBName=CG2,ResName=THR,ResNum=195)           0     28.860583     27.260819     62.723076  L
 H-HC-0.064200(PDBName=1HG2,ResName=THR,ResNum=195)           0     28.049833     27.917839     62.406853  L
 H-HC-0.064200(PDBName=2HG2,ResName=THR,ResNum=195)           0     28.749658     27.058153     63.788298  L
 H-HC-0.064200(PDBName=3HG2,ResName=THR,ResNum=195)           0     29.817733     27.751817     62.551987  L
 O-OH--0.676100(PDBName=OG1,ResName=THR,ResNum=195)           0     27.565451     25.342640     62.181679  L
 H-HO-0.410200(PDBName=1HG,ResName=THR,ResNum=195)            0     27.728538     24.550306     62.715855  L
 C-C-0.597300(PDBName=C,ResName=THR,ResNum=195)               0     28.143041     27.106805     59.795971  L
 O-O--0.567900(PDBName=O,ResName=THR,ResNum=195)              0     28.535509     28.258924     59.614496  L
 N-N--0.415700(PDBName=N,ResName=LEU,ResNum=196)              0     26.937663     26.666509     59.445494  L
 H-H-0.271900(PDBName=H,ResName=LEU,ResNum=196)               0     26.744967     25.690503     59.646986  L
 C-CT--0.051800(PDBName=CA,ResName=LEU,ResNum=196)            0     25.874312     27.412162     58.790890  L
 H-H1-0.092200(PDBName=HA,ResName=LEU,ResNum=196)             0     26.194072     28.438032     58.633168  L
 C-CT--0.110200(PDBName=CB,ResName=LEU,ResNum=196)            0     25.627749     26.755106     57.418112  L
 H-HC-0.045700(PDBName=2HB,ResName=LEU,ResNum=196)            0     26.516280     26.903149     56.804594  L
 H-HC-0.045700(PDBName=3HB,ResName=LEU,ResNum=196)            0     25.505397     25.681101     57.564295  L
 C-CT-0.353100(PDBName=CG,ResName=LEU,ResNum=196)             0     24.396740     27.261991     56.647468  L
 H-HC--0.036100(PDBName=HG,ResName=LEU,ResNum=196)            0     23.486465     26.997602     57.185148  L
 C-CT--0.412100(PDBName=CD1,ResName=LEU,ResNum=196)           0     24.420069     28.772974     56.432920  L
 H-HC-0.100000(PDBName=1HD1,ResName=LEU,ResNum=196)           0     25.383265     29.070828     56.024966  L
 H-HC-0.100000(PDBName=2HD1,ResName=LEU,ResNum=196)           0     23.626063     29.057391     55.744628  L
 H-HC-0.100000(PDBName=3HD1,ResName=LEU,ResNum=196)           0     24.259011     29.285060     57.380318  L
 C-CT--0.412100(PDBName=CD2,ResName=LEU,ResNum=196)           0     24.356096     26.592552     55.274259  L
 H-HC-0.100000(PDBName=1HD2,ResName=LEU,ResNum=196)           0     24.308022     25.510102     55.394284  L
 H-HC-0.100000(PDBName=2HD2,ResName=LEU,ResNum=196)           0     23.474586     26.925227     54.729347  L
 H-HC-0.100000(PDBName=3HD2,ResName=LEU,ResNum=196)           0     25.247195     26.847773     54.700159  L
 C-C-0.597300(PDBName=C,ResName=LEU,ResNum=196)               0     24.637468     27.392677     59.696730  L
 O-O--0.567900(PDBName=O,ResName=LEU,ResNum=196)              0     24.025488     26.337842     59.852766  L
 N-N--0.415700(PDBName=N,ResName=ASN,ResNum=197)              0     24.261281     28.529078     60.288484  L
 H-H-0.271900(PDBName=H,ResName=ASN,ResNum=197)               0     24.805294     29.365059     60.091600  L
 C-CT-0.014300(PDBName=CA,ResName=ASN,ResNum=197)             0     23.081713     28.642514     61.153270  L
 H-H1-0.104800(PDBName=HA,ResName=ASN,ResNum=197)             0     22.541873     27.698501     61.123256  L
 C-CT--0.204100(PDBName=CB,ResName=ASN,ResNum=197)            0     23.484033     28.876516     62.624172  L
 H-HC-0.079700(PDBName=2HB,ResName=ASN,ResNum=197)            0     24.071758     28.038403     62.991722  L
 H-HC-0.079700(PDBName=3HB,ResName=ASN,ResNum=197)            0     24.082152     29.784368     62.706525  L
 C-C-0.713000(PDBName=CG,ResName=ASN,ResNum=197)              0     22.233251     29.008136     63.485105  L
 O-O--0.593100(PDBName=OD1,ResName=ASN,ResNum=197)            0     21.579555     28.032700     63.831540  L
 N-N--0.919100(PDBName=ND2,ResName=ASN,ResNum=197)            0     21.792294     30.217014     63.733187  L
 H-H-0.419600(PDBName=1HD2,ResName=ASN,ResNum=197)            0     20.774176     30.243917     63.830743  L
 H-H-0.419600(PDBName=2HD2,ResName=ASN,ResNum=197)            0     22.282293     31.016381     63.377420  L
 C-C-0.597300(PDBName=C,ResName=ASN,ResNum=197)               0     22.097533     29.718926     60.672544  L
 O-O--0.567900(PDBName=O,ResName=ASN,ResNum=197)              0     22.490669     30.843697     60.358144  L
 N-N--0.382100(PDBName=N,ResName=PHE,ResNum=198)              0     20.816906     29.360026     60.710878  L
 H-H-0.268100(PDBName=H,ResName=PHE,ResNum=198)               0     20.630629     28.390318     60.941623  L
 C-CT--0.182500(PDBName=CA,ResName=PHE,ResNum=198)            0     19.622352     30.205387     60.644152  L
 H-H1-0.109800(PDBName=HA,ResName=PHE,ResNum=198)             0     19.890503     31.250656     60.800856  L
 C-CT--0.095900(PDBName=CB,ResName=PHE,ResNum=198)            0     18.977293     30.062775     59.249733  L
 H-HC-0.044300(PDBName=2HB,ResName=PHE,ResNum=198)            0     17.974994     30.486239     59.282862  L
 H-HC-0.044300(PDBName=3HB,ResName=PHE,ResNum=198)            0     19.547421     30.665963     58.546654  L
 C-CA-0.055200(PDBName=CG,ResName=PHE,ResNum=198)             0     18.912079     28.643342     58.704399  L
 C-CA--0.130000(PDBName=CD1,ResName=PHE,ResNum=198)           0     20.023827     28.100889     58.032750  L
 H-HA-0.140800(PDBName=HD1,ResName=PHE,ResNum=198)            0     20.912075     28.699802     57.898517  L
 C-CA--0.184700(PDBName=CE1,ResName=PHE,ResNum=198)           0     19.996025     26.772736     57.578085  L
 H-HA-0.146100(PDBName=HE1,ResName=PHE,ResNum=198)            0     20.868492     26.361124     57.095188  L
 C-CA--0.094400(PDBName=CZ,ResName=PHE,ResNum=198)            0     18.845857     25.985929     57.769068  L
 H-HA-0.128000(PDBName=HZ,ResName=PHE,ResNum=198)             0     18.823893     24.962124     57.427246  L
 C-CA--0.184700(PDBName=CE2,ResName=PHE,ResNum=198)           0     17.721406     26.531582     58.410281  L
 H-HA-0.146100(PDBName=HE2,ResName=PHE,ResNum=198)            0     16.830815     25.938642     58.560473  L
 C-CA--0.130000(PDBName=CD2,ResName=PHE,ResNum=198)           0     17.759389     27.855402     58.878515  L
 H-HA-0.140800(PDBName=HD2,ResName=PHE,ResNum=198)            0     16.908551     28.264703     59.397263  L
 C-C-0.766000(PDBName=C,ResName=PHE,ResNum=198)               0     18.712582     29.812973     61.818391  L
 O-O2--0.802600(PDBName=O,ResName=PHE,ResNum=198)             0     19.117592     30.075974     62.970913  L
 O-O2--0.802600(PDBName=OXT,ResName=PHE,ResNum=198)           0     17.760454     29.025782     61.642019  L
 N-N3-0.181200(PDBName=N,ResName=THR,ResNum=199)              0     28.384239     33.951066     41.425607  L
 H-H-0.193400(PDBName=H1,ResName=THR,ResNum=199)              0     28.787663     34.769394     40.991491  L
 H-H-0.193400(PDBName=H2,ResName=THR,ResNum=199)              0     28.916801     33.697662     42.245789  L
 H-H-0.193400(PDBName=H3,ResName=THR,ResNum=199)              0     27.438548     34.152674     41.732308  L
 C-CT-0.003400(PDBName=CA,ResName=THR,ResNum=199)             0     28.391103     32.825896     40.468035  L
 H-HP-0.108700(PDBName=HA,ResName=THR,ResNum=199)             0     27.655090     33.016720     39.690024  L
 C-CT-0.451400(PDBName=CB,ResName=THR,ResNum=199)             0     29.768704     32.711911     39.813420  L
 H-H1--0.032300(PDBName=HB,ResName=THR,ResNum=199)            0     30.465435     32.223126     40.489801  L
 C-CT--0.255400(PDBName=CG2,ResName=THR,ResNum=199)           0     29.724986     31.997833     38.471830  L
 H-HC-0.062700(PDBName=1HG2,ResName=THR,ResNum=199)           0     30.721980     31.965462     38.030444  L
 H-HC-0.062700(PDBName=2HG2,ResName=THR,ResNum=199)           0     29.388568     30.977603     38.614802  L
 H-HC-0.062700(PDBName=3HG2,ResName=THR,ResNum=199)           0     29.045818     32.507102     37.787112  L
 O-OH--0.676400(PDBName=OG1,ResName=THR,ResNum=199)           0     30.244697     34.008251     39.541675  L
 H-HO-0.407000(PDBName=1HG,ResName=THR,ResNum=199)            0     31.052215     33.916537     39.018093  L
 C-C-0.616300(PDBName=C,ResName=THR,ResNum=199)               0     28.012804     31.557673     41.214949  L
 O-O--0.572200(PDBName=O,ResName=THR,ResNum=199)              0     28.410226     31.413447     42.366602  L
 N-N--0.415700(PDBName=N,ResName=ILE,ResNum=200)              0     27.190219     30.672061     40.645773  L
 H-H-0.271900(PDBName=H,ResName=ILE,ResNum=200)               0     26.932419     30.765601     39.665181  L
 C-CT--0.059700(PDBName=CA,ResName=ILE,ResNum=200)            0     26.549550     29.576987     41.400262  L
 H-H1-0.086900(PDBName=HA,ResName=ILE,ResNum=200)             0     26.301417     29.946352     42.393585  L
 C-CT-0.130300(PDBName=CB,ResName=ILE,ResNum=200)             0     25.217478     29.156025     40.733503  L
 H-HC-0.018700(PDBName=HB,ResName=ILE,ResNum=200)             0     25.442576     28.633423     39.801596  L
 C-CT--0.320400(PDBName=CG2,ResName=ILE,ResNum=200)           0     24.446738     28.185158     41.642672  L
 H-HC-0.088200(PDBName=1HG2,ResName=ILE,ResNum=200)           0     25.037152     27.290885     41.848329  L
 H-HC-0.088200(PDBName=2HG2,ResName=ILE,ResNum=200)           0     24.188732     28.657247     42.587651  L
 H-HC-0.088200(PDBName=3HG2,ResName=ILE,ResNum=200)           0     23.524660     27.878277     41.150994  L
 C-CT--0.043000(PDBName=CG1,ResName=ILE,ResNum=200)           0     24.301721     30.350160     40.368981  L
 H-HC-0.023600(PDBName=2HG1,ResName=ILE,ResNum=200)           0     24.739114     30.895647     39.533516  L
 H-HC-0.023600(PDBName=3HG1,ResName=ILE,ResNum=200)           0     23.346227     29.960388     40.027157  L
 C-CT--0.066000(PDBName=CD1,ResName=ILE,ResNum=200)           0     24.013553     31.350830     41.493707  L
 H-HC-0.018600(PDBName=1HD1,ResName=ILE,ResNum=200)           0     23.339804     32.119346     41.115163  L
 H-HC-0.018600(PDBName=2HD1,ResName=ILE,ResNum=200)           0     23.536627     30.846474     42.332857  L
 H-HC-0.018600(PDBName=3HD1,ResName=ILE,ResNum=200)           0     24.932920     31.830499     41.826333  L
 C-C-0.597300(PDBName=C,ResName=ILE,ResNum=200)               0     27.517296     28.395160     41.584653  L
 O-O--0.567900(PDBName=O,ResName=ILE,ResNum=200)              0     27.571258     27.482450     40.751646  L
 N-N--0.415700(PDBName=N,ResName=MET,ResNum=201)              0     28.318549     28.416128     42.653699  L H-H1 3153 0.0000
 H-H-0.271900(PDBName=H,ResName=MET,ResNum=201)               0     28.224050     29.157158     43.332897  L
 C-CT--0.023700(PDBName=CA,ResName=MET,ResNum=201)            0     29.443064     27.474445     42.802299  H
 H-H1-0.088000(PDBName=HA,ResName=MET,ResNum=201)             0     29.707112     27.079542     41.800050  H
 C-CT-0.034200(PDBName=CB,ResName=MET,ResNum=201)             0     30.694998     28.220209     43.294048  L H-H1 3153 0.0000
 H-HC-0.024100(PDBName=2HB,ResName=MET,ResNum=201)            0     30.550530     28.512141     44.332233  L
 H-HC-0.024100(PDBName=3HB,ResName=MET,ResNum=201)            0     31.528743     27.523056     43.247308  L
 C-CT-0.001800(PDBName=CG,ResName=MET,ResNum=201)             0     31.110230     29.462792     42.497912  L
 H-H1-0.044000(PDBName=2HG,ResName=MET,ResNum=201)            0     30.554260     30.318474     42.875283  L
 H-H1-0.044000(PDBName=3HG,ResName=MET,ResNum=201)            0     32.163516     29.647228     42.705390  L
 S-S--0.273700(PDBName=SD,ResName=MET,ResNum=201)             0     30.878785     29.377653     40.703932  L
 C-CT--0.053600(PDBName=CE,ResName=MET,ResNum=201)            0     32.395514     30.165593     40.112926  L
 H-H1-0.068400(PDBName=1HE,ResName=MET,ResNum=201)            0     32.514109     31.147642     40.568719  L
 H-H1-0.068400(PDBName=2HE,ResName=MET,ResNum=201)            0     33.250743     29.539283     40.367826  L
 H-H1-0.068400(PDBName=3HE,ResName=MET,ResNum=201)            0     32.340843     30.273273     39.029661  L
 C-C-0.597300(PDBName=C,ResName=MET,ResNum=201)               0     29.130745     26.221367     43.656752  H
 O-O--0.567900(PDBName=O,ResName=MET,ResNum=201)              0     30.117413     25.543579     44.099414  H
 N-N--0.415700(PDBName=N,ResName=MET,ResNum=202)              0     28.001980     25.493053     43.074092  H
 H-H-0.271900(PDBName=H,ResName=MET,ResNum=202)               0     27.995538     25.650373     42.061216  H
 C-CT--0.023700(PDBName=CA,ResName=MET,ResNum=202)            0     28.029363     24.036445     43.252626  H
 H-H1-0.088000(PDBName=HA,ResName=MET,ResNum=202)             0     28.412394     23.838970     44.248493  H
 C-CT-0.034200(PDBName=CB,ResName=MET,ResNum=202)             0     26.591790     23.495181     43.159287  L H-H1 3170 0.0000
 H-HC-0.024100(PDBName=2HB,ResName=MET,ResNum=202)            0     25.996050     24.019530     43.907934  L
 H-HC-0.024100(PDBName=3HB,ResName=MET,ResNum=202)            0     26.168920     23.738713     42.187582  L
 C-CT-0.001800(PDBName=CG,ResName=MET,ResNum=202)             0     26.435317     21.988698     43.427254  L
 H-H1-0.044000(PDBName=2HG,ResName=MET,ResNum=202)            0     26.886668     21.754758     44.391445  L
 H-H1-0.044000(PDBName=3HG,ResName=MET,ResNum=202)            0     25.372795     21.799719     43.513144  L
 S-S--0.273700(PDBName=SD,ResName=MET,ResNum=202)             0     27.043936     20.791596     42.202858  L
 C-CT--0.053600(PDBName=CE,ResName=MET,ResNum=202)            0     26.228688     21.384613     40.705469  L
 H-H1-0.068400(PDBName=1HE,ResName=MET,ResNum=202)            0     26.449683     20.710403     39.879767  L
 H-H1-0.068400(PDBName=2HE,ResName=MET,ResNum=202)            0     25.152528     21.430715     40.870146  L
 H-H1-0.068400(PDBName=3HE,ResName=MET,ResNum=202)            0     26.609813     22.374191     40.462799  L
 C-C-0.597300(PDBName=C,ResName=MET,ResNum=202)               0     28.976593     23.306605     42.280861  L H-H1 3170 0.0000
 O-O--0.567900(PDBName=O,ResName=MET,ResNum=202)              0     28.950334     23.551951     41.077413  L
 N-N--0.415700(PDBName=N,ResName=GLN,ResNum=203)              0     29.782829     22.396937     42.828857  L
 H-H-0.271900(PDBName=H,ResName=GLN,ResNum=203)               0     29.709390     22.225192     43.821735  L
 C-CT--0.003100(PDBName=CA,ResName=GLN,ResNum=203)            0     30.715838     21.532294     42.112758  L
 H-H1-0.085000(PDBName=HA,ResName=GLN,ResNum=203)             0     30.553864     21.661760     41.045997  L
 C-CT--0.003600(PDBName=CB,ResName=GLN,ResNum=203)            0     32.156317     21.971009     42.438983  L
 H-HC-0.017100(PDBName=2HB,ResName=GLN,ResNum=203)            0     32.393634     22.808576     41.785756  L
 H-HC-0.017100(PDBName=3HB,ResName=GLN,ResNum=203)            0     32.206802     22.341134     43.454158  L
 C-CT--0.064500(PDBName=CG,ResName=GLN,ResNum=203)            0     33.255816     20.909930     42.264574  L
 H-HC-0.035200(PDBName=2HG,ResName=GLN,ResNum=203)            0     33.072177     20.371263     41.339222  L
 H-HC-0.035200(PDBName=3HG,ResName=GLN,ResNum=203)            0     34.206846     21.430983     42.167189  L
 C-C-0.695100(PDBName=CD,ResName=GLN,ResNum=203)              0     33.422343     19.912966     43.419631  L
 O-O--0.608600(PDBName=OE1,ResName=GLN,ResNum=203)            0     33.337480     20.227213     44.598936  L
 N-N--0.940700(PDBName=NE2,ResName=GLN,ResNum=203)            0     33.742601     18.675848     43.126584  L
 H-H-0.425100(PDBName=1HE2,ResName=GLN,ResNum=203)            0     34.202707     18.131077     43.845777  L
 H-H-0.425100(PDBName=2HE2,ResName=GLN,ResNum=203)            0     33.657004     18.333294     42.165106  L
 C-C-0.597300(PDBName=C,ResName=GLN,ResNum=203)               0     30.466735     20.060259     42.454057  L
 O-O--0.567900(PDBName=O,ResName=GLN,ResNum=203)              0     30.240741     19.722441     43.616475  L
 N-N--0.348100(PDBName=N,ResName=ARG,ResNum=204)              0     30.596331     19.185449     41.447363  L
 H-H-0.276400(PDBName=H,ResName=ARG,ResNum=204)               0     30.850772     19.616989     40.564126  L
 C-CT--0.306800(PDBName=CA,ResName=ARG,ResNum=204)            0     30.774868     17.721330     41.531931  L
 H-H1-0.144700(PDBName=HA,ResName=ARG,ResNum=204)             0     31.195712     17.465968     42.502527  L
 C-CT--0.037400(PDBName=CB,ResName=ARG,ResNum=204)            0     29.433055     16.978968     41.331734  L
 H-HC-0.037100(PDBName=2HB,ResName=ARG,ResNum=204)            0     28.989595     17.318710     40.393883  L
 H-HC-0.037100(PDBName=3HB,ResName=ARG,ResNum=204)            0     29.642521     15.913491     41.221708  L
 C-CT-0.074400(PDBName=CG,ResName=ARG,ResNum=204)             0     28.379375     17.131748     42.439645  L
 H-HC-0.018500(PDBName=2HG,ResName=ARG,ResNum=204)            0     28.115038     18.181582     42.550305  L
 H-HC-0.018500(PDBName=3HG,ResName=ARG,ResNum=204)            0     27.481451     16.607212     42.111309  L
 C-CT-0.111400(PDBName=CD,ResName=ARG,ResNum=204)             0     28.799607     16.540125     43.797634  L
 H-H1-0.046800(PDBName=2HD,ResName=ARG,ResNum=204)            0     27.991261     15.906252     44.164635  L
 H-H1-0.046800(PDBName=3HD,ResName=ARG,ResNum=204)            0     29.694416     15.928102     43.673347  L
 N-N2--0.556400(PDBName=NE,ResName=ARG,ResNum=204)            0     29.050743     17.597714     44.783019  L
 H-H-0.347900(PDBName=HE,ResName=ARG,ResNum=204)              0     29.147833     18.541516     44.413722  L
 C-CA-0.836800(PDBName=CZ,ResName=ARG,ResNum=204)             0     29.391626     17.508679     46.046077  L
 N-N2--0.873700(PDBName=NH1,ResName=ARG,ResNum=204)           0     29.560231     18.568711     46.761934  L
 H-H-0.449300(PDBName=1HH1,ResName=ARG,ResNum=204)            0     29.406339     19.498850     46.376981  L
 H-H-0.449300(PDBName=2HH1,ResName=ARG,ResNum=204)            0     29.872987     18.442827     47.720257  L
 N-N2--0.873700(PDBName=NH2,ResName=ARG,ResNum=204)           0     29.581066     16.378999     46.655659  L
 H-H-0.449300(PDBName=1HH2,ResName=ARG,ResNum=204)            0     29.557868     15.519705     46.152726  L
 H-H-0.449300(PDBName=2HH2,ResName=ARG,ResNum=204)            0     29.927743     16.476182     47.612622  L
 C-C-0.855700(PDBName=C,ResName=ARG,ResNum=204)               0     31.823062     17.280437     40.499434  L
 O-O2--0.826600(PDBName=O,ResName=ARG,ResNum=204)             0     31.446746     16.715453     39.454709  L
 O-O2--0.826600(PDBName=OXT,ResName=ARG,ResNum=204)           0     33.013689     17.591064     40.712620  L
 O-OW--0.834000(PDBName=O,ResName=WAT,ResNum=262)             0     28.723544     25.443140     39.408819  L
 H-HW-0.417000(PDBName=H1,ResName=WAT,ResNum=262)             0     28.896768     24.733419     40.080581  L
 H-HW-0.417000(PDBName=H2,ResName=WAT,ResNum=262)             0     28.245548     26.104084     39.941721  L
 O-OW--0.834000(PDBName=O,ResName=WAT,ResNum=281)             0     28.460439     26.992542     45.089272  H
 H-HW-0.417000(PDBName=H1,ResName=WAT,ResNum=281)             0     29.013321     26.509245     45.749861  H
 H-HW-0.417000(PDBName=H2,ResName=WAT,ResNum=281)             0     27.362860     26.841383     45.626749  H

 1 2 1.0 3 1.0 4 1.0 13 1.0
 2
 3
 4 5 1.0 6 1.0 7 1.0
 5
 6
 7 8 1.0 9 1.0 10 1.0
 8
 9
 10 11 1.0 12 1.0 13 1.0
 11
 12
 13 14 1.0 15 1.0
 14
 15 16 2.0 17 1.5
 16
 17 18 1.0 19 1.0
 18
 19 20 1.0 21 1.0 32 1.0
 20
 21 22 1.0 23 1.0 24 1.0
 22
 23
 24 25 1.0 26 1.0 27 1.0
 25
 26
 27 28 2.0 29 2.0
 28
 29 30 1.0 31 1.0
 30
 31
 32 33 2.0 34 1.5
 33
 34 35 1.0 36 1.0
 35
 36 37 1.0 38 1.0 51 1.0
 37
 38 39 1.0 40 1.0 44 1.0
 39
 40 41 1.0 42 1.0 43 1.0
 41
 42
 43
 44 45 1.0 46 1.0 47 1.0
 45
 46
 47 48 1.0 49 1.0 50 1.0
 48
 49
 50
 51 52 2.0 53 1.5
 52
 53 54 1.0 55 1.0
 54
 55 56 1.0 57 1.0 65 1.0
 56
 57 58 1.0 59 1.0 63 1.0
 58
 59 60 1.0 61 1.0 62 1.0
 60
 61
 62
 63 64 1.0
 64
 65 66 2.0 67 1.5
 66
 67 68 1.0 69 1.0
 68
 69 70 1.0 71 1.0 84 1.0
 70
 71 72 1.0 73 1.0 74 1.0
 72
 73
 74 75 1.0 76 1.0 80 1.0
 75
 76 77 1.0 78 1.0 79 1.0
 77
 78
 79
 80 81 1.0 82 1.0 83 1.0
 81
 82
 83
 84 85 2.0 86 1.5
 85
 86 87 1.0 88 1.0
 87
 88 89 1.0 90 1.0 108 1.0
 89
 90 91 1.0 92 1.0 93 1.0
 91
 92
 93 94 2.0 107 1.0
 94 95 1.0 96 1.0
 95
 96 97 1.0 98 1.5
 97
 98 99 1.5 107 1.5
 99 100 1.0 101 1.5
 100
 101 102 1.0 103 1.5
 102
 103 104 1.0 105 1.5
 104
 105 106 1.0 107 1.5
 106
 107
 108 109 2.0 110 1.5
 109
 110 111 1.0 112 1.0
 111
 112 113 1.0 114 1.0 125 1.0
 113
 114 115 1.0 116 1.0 117 1.0
 115
 116
 117 118 1.0 119 1.0 120 1.0
 118
 119
 120 121 2.0 122 2.0
 121
 122 123 1.0 124 1.0
 123
 124
 125 126 2.0 127 1.5
 126
 127 128 1.0 129 1.0
 128
 129 130 1.0 131 1.0 149 1.0
 130
 131 132 1.0 133 1.0 134 1.0
 132
 133
 134 135 1.0 136 1.0 137 1.0
 135
 136
 137 138 1.0 139 1.0 140 1.0
 138
 139
 140 141 1.0 142 2.0
 141
 142 143 2.0 146 2.0
 143 144 1.0 145 1.0
 144
 145
 146 147 1.0 148 1.0
 147
 148
 149 150 2.0 151 1.5
 150
 151 152 1.0 161 1.0
 152 153 1.0 154 1.0 155 1.0
 153
 154
 155 156 1.0 157 1.0 158 1.0
 156
 157
 158 159 1.0 160 1.0 161 1.0
 159
 160
 161 162 1.0 163 1.0
 162
 163 164 2.0 165 1.5
 164
 165 166 1.0 167 1.0
 166
 167 168 1.0 169 1.0 182 1.0
 168
 169 170 1.0 171 1.0 172 1.0
 170
 171
 172 173 1.0 174 1.0 178 1.0
 173
 174 175 1.0 176 1.0 177 1.0
 175
 176
 177
 178 179 1.0 180 1.0 181 1.0
 179
 180
 181
 182 183 2.0 184 1.5
 183
 184 185 1.0 186 1.0
 185
 186 187 1.0 188 1.0 198 1.0
 187
 188 189 1.0 190 1.0 194 1.0
 189
 190 191 1.0 192 1.0 193 1.0
 191
 192
 193
 194 195 1.0 196 1.0 197 1.0
 195
 196
 197
 198 199 2.0 200 1.5
 199
 200 201 1.0 202 1.0
 201
 202 203 1.0 204 1.0 212 1.0
 203
 204 205 1.0 206 1.0 210 1.0
 205
 206 207 1.0 208 1.0 209 1.0
 207
 208
 209
 210 211 1.0
 211
 212 213 2.0 214 1.5
 213
 214 215 1.0 216 1.0
 215
 216 217 1.0 218 1.0 231 1.0
 217
 218 219 1.0 220 1.0 224 1.0
 219
 220 221 1.0 222 1.0 223 1.0
 221
 222
 223
 224 225 1.0 226 1.0 227 1.0
 225
 226
 227 228 1.0 229 1.0 230 1.0
 228
 229
 230
 231 232 2.0 233 1.5
 232
 233 234 1.0 235 1.0
 234
 235 236 1.0 237 1.0 255 1.0
 236
 237 238 1.0 239 1.0 240 1.0
 238
 239
 240 241 1.0 242 1.0 243 1.0
 241
 242
 243 244 1.0 245 1.0 246 1.0
 244
 245
 246 247 1.0 248 2.0
 247
 248 249 2.0 252 2.0
 249 250 1.0 251 1.0
 250
 251
 252 253 1.0 254 1.0
 253
 254
 255 256 2.0 257 1.5
 256
 257 258 1.0 259 1.0
 258
 259 260 1.0 261 1.0 274 1.0
 260
 261 262 1.0 263 1.0 267 1.0
 262
 263 264 1.0 265 1.0 266 1.0
 264
 265
 266
 267 268 1.0 269 1.0 270 1.0
 268
 269
 270 271 1.0 272 1.0 273 1.0
 271
 272
 273
 274 275 2.0 276 1.5
 275
 276 277 1.0 278 1.0
 277
 278 279 1.0 280 1.0 281 1.0
 279
 280
 281 282 2.0 283 1.5
 282
 283 284 1.0 285 1.0
 284
 285 286 1.0 287 1.0 288 1.0
 286
 287
 288 289 2.0 290 1.5
 289
 290 291 1.0 292 1.0
 291
 292 293 1.0 294 1.0 305 1.0
 293
 294 295 1.0 296 1.0 297 1.0
 295
 296
 297 298 1.0 299 1.0 300 1.0
 298
 299
 300 301 2.0 302 2.0
 301
 302 303 1.0 304 1.0
 303
 304
 305 306 2.0 307 1.5
 306
 307 308 1.0 309 1.0
 308
 309 310 1.0 311 1.0 324 1.0
 310
 311 312 1.0 313 1.0 314 1.0
 312
 313
 314 315 1.0 316 1.0 320 1.0
 315
 316 317 1.0 318 1.0 319 1.0
 317
 318
 319
 320 321 1.0 322 1.0 323 1.0
 321
 322
 323
 324 325 2.0 326 1.5
 325
 326 327 1.0 328 1.0
 327
 328 329 1.0 330 1.0 346 1.0
 329
 330 331 1.0 332 1.0 333 1.0
 331
 332
 333 334 1.0 335 1.0 336 1.0
 334
 335
 336 337 1.0 338 1.0 339 1.0
 337
 338
 339 340 1.0 341 1.0 342 1.0
 340
 341
 342 343 1.0 344 1.0 345 1.0
 343
 344
 345
 346 347 2.0 348 1.5
 347
 348 349 1.0 350 1.0
 349
 350 351 1.0 352 1.0 361 1.0
 351
 352 353 1.0 354 1.0 355 1.0
 353
 354
 355 356 1.0 357 1.0 358 1.0
 356
 357
 358 359 2.0 360 2.0
 359
 360
 361 362 2.0 363 1.5
 362
 363 364 1.0 365 1.0
 364
 365 366 1.0 367 1.0 371 1.0
 366
 367 368 1.0 369 1.0 370 1.0
 368
 369
 370
 371 372 2.0 373 1.5
 372
 373 374 1.0 375 1.0
 374
 375 376 1.0 377 1.0 390 1.0
 376
 377 378 1.0 379 1.0 380 1.0
 378
 379
 380 381 1.0 382 1.0 386 1.0
 381
 382 383 1.0 384 1.0 385 1.0
 383
 384
 385
 386 387 1.0 388 1.0 389 1.0
 387
 388
 389
 390 391 2.0 392 1.5
 391
 392 393 1.0 394 1.0
 393
 394 395 1.0 396 1.0 409 1.0
 395
 396 397 1.0 398 1.0 399 1.0
 397
 398
 399 400 1.0 401 1.0 405 1.0
 400
 401 402 1.0 403 1.0 404 1.0
 402
 403
 404
 405 406 1.0 407 1.0 408 1.0
 406
 407
 408
 409 410 2.0 411 1.5
 410
 411 412 1.0 413 1.0
 412
 413 414 1.0 415 1.0 421 1.0
 414
 415 416 1.0 417 1.0 418 1.0
 416
 417
 418 419 1.5 420 2.0
 419 3231 1.0
 420
 421 422 2.0 423 1.5
 422
 423 424 1.0 425 1.0
 424
 425 426 1.0 427 1.0 435 1.0
 426
 427 428 1.0 429 1.0 433 1.0
 428
 429 430 1.0 431 1.0 432 1.0
 430
 431
 432
 433 434 1.0
 434
 435 436 2.0 437 1.5
 436
 437 438 1.0 439 1.0
 438
 439 440 1.0 441 1.0 442 1.0
 440
 441
 442 443 2.0 444 1.5
 443
 444 445 1.0 446 1.0
 445
 446 447 1.0 448 1.0 452 1.0
 447
 448 449 1.0 450 1.0 451 1.0
 449
 450
 451
 452 453 2.0 454 1.5
 453
 454 455 1.0 456 1.0
 455
 456 457 1.0 458 1.0 464 1.0
 457
 458 459 1.0 460 1.0 461 1.0
 459
 460
 461 462 2.0 463 2.0
 462
 463
 464 465 2.0 466 1.5
 465
 466 467 1.0 468 1.0
 467
 468 469 1.0 470 1.0 476 1.0
 469
 470 471 1.0 472 1.0 473 1.0
 471
 472
 473 474 2.0 475 2.0
 474
 475
 476 477 2.0 478 1.5
 477
 478 479 1.0 480 1.0
 479
 480 481 1.0 482 1.0 490 1.0
 481
 482 483 1.0 484 1.0 488 1.0
 483
 484 485 1.0 486 1.0 487 1.0
 485
 486
 487
 488 489 1.0
 489
 490 491 2.0 492 1.5
 491
 492 493 1.0 494 1.0
 493
 494 495 1.0 496 1.0 506 1.0
 495
 496 497 1.0 498 1.0 502 1.0
 497
 498 499 1.0 500 1.0 501 1.0
 499
 500
 501
 502 503 1.0 504 1.0 505 1.0
 503
 504
 505
 506 507 2.0 508 1.5
 507
 508 509 1.0 510 1.0
 509
 510 511 1.0 512 1.0 525 1.0
 511
 512 513 1.0 514 1.0 515 1.0
 513
 514
 515 516 1.0 517 1.0 521 1.0
 516
 517 518 1.0 519 1.0 520 1.0
 518
 519
 520
 521 522 1.0 523 1.0 524 1.0
 522
 523
 524
 525 526 2.0 527 1.5
 526
 527 528 1.0 529 1.0
 528
 529 530 1.0 531 1.0 540 1.0
 530
 531 532 1.0 533 1.0 534 1.0
 532
 533
 534 535 1.0 536 1.0 537 1.0
 535
 536
 537 538 2.0 539 2.0
 538
 539
 540 541 2.0 542 1.5
 541
 542 543 1.0 544 1.0
 543
 544 545 1.0 546 1.0 555 1.0
 545
 546 547 1.0 548 1.0 549 1.0
 547
 548
 549 550 1.0 551 1.0 552 1.0
 550
 551
 552 553 2.0 554 2.0
 553
 554
 555 556 2.0 557 1.5
 556
 557 558 1.0 559 1.0
 558
 559 560 1.0 561 1.0 572 1.0
 560
 561 562 1.0 563 1.0 564 1.0
 562
 563
 564 565 1.0 566 1.0 567 1.0
 565
 566
 567 568 1.0
 568 569 1.0 570 1.0 571 1.0
 569
 570
 571
 572 573 2.0 574 1.5
 573
 574 575 1.0 576 1.0
 575
 576 577 1.0 578 1.0 586 1.0
 577
 578 579 1.0 580 1.0 581 1.0
 579
 580
 581 582 2.0 583 2.0
 582
 583 584 1.0 585 1.0
 584
 585
 586 587 2.0 588 1.5
 587
 588 589 1.0 590 1.0
 589
 590 591 1.0 592 1.0 605 1.0
 591
 592 593 1.0 594 1.0 595 1.0
 593
 594
 595 596 1.0 597 1.0 601 1.0
 596
 597 598 1.0 599 1.0 600 1.0
 598
 599
 600
 601 602 1.0 603 1.0 604 1.0
 602
 603
 604
 605 606 2.0 607 1.5
 606
 607 608 1.0 617 1.0
 608 609 1.0 610 1.0 611 1.0
 609
 610
 611 612 1.0 613 1.0 614 1.0
 612
 613
 614 615 1.0 616 1.0 617 1.0
 615
 616
 617 618 1.0 619 1.0
 618
 619 620 2.0 621 1.5
 620
 621 622 1.0 623 1.0
 622
 623 624 1.0 625 1.0 626 1.0
 624
 625
 626 627 2.0 628 1.5
 627
 628 629 1.0 630 1.0
 629
 630 631 1.0 632 1.0 648 1.0
 631
 632 633 1.0 634 1.0 635 1.0
 633
 634
 635 636 1.0 637 1.0 638 1.0
 636
 637
 638 639 1.0 640 1.0 641 1.0
 639
 640
 641 642 1.0 643 1.0 644 1.0
 642
 643
 644 645 1.0 646 1.0 647 1.0
 645
 646
 647
 648 649 2.0 650 1.5
 649
 650 651 1.0 652 1.0
 651
 652 653 1.0 654 1.0 672 1.0
 653
 654 655 1.0 656 1.0 657 1.0
 655
 656
 657 658 2.0 671 1.0
 658 659 1.0 660 1.0
 659
 660 661 1.0 662 1.5
 661
 662 663 1.5 671 1.5
 663 664 1.0 665 1.5
 664
 665 666 1.0 667 1.5
 666
 667 668 1.0 669 1.5
 668
 669 670 1.0 671 1.5
 670
 671
 672 673 2.0 674 1.5
 673
 674 675 1.0 676 1.0
 675
 676 677 1.0 678 1.0 694 1.0
 677
 678 679 1.0 680 1.0 681 1.0
 679
 680
 681 682 1.0 683 1.0 684 1.0
 682
 683
 684 685 1.0 686 1.0 687 1.0
 685
 686
 687 688 1.0 689 1.0 690 1.0
 688
 689
 690 691 1.0 692 1.0 693 1.0
 691
 692
 693
 694 695 2.0 696 1.5
 695
 696 697 1.0 706 1.0
 697 698 1.0 699 1.0 700 1.0
 698
 699
 700 701 1.0 702 1.0 703 1.0
 701
 702
 703 704 1.0 705 1.0 706 1.0
 704
 705
 706 707 1.0 708 1.0
 707
 708 709 2.0 710 1.5
 709
 710 711 1.0 712 1.0
 711
 712 713 1.0 714 1.0 730 1.0
 713
 714 715 1.0 716 1.0 717 1.0
 715
 716
 717 718 1.0 719 1.0 720 1.0
 718
 719
 720 721 1.0 722 1.0 723 1.0
 721
 722
 723 724 1.0 725 1.0 726 1.0
 724
 725
 726 727 1.0 728 1.0 729 1.0
 727
 728
 729
 730 731 2.0 732 1.5
 731
 732 733 1.0 734 1.0
 733
 734 735 1.0 736 1.0 747 1.0
 735
 736 737 1.0 738 1.0 739 1.0
 737
 738
 739 740 1.0 741 1.0 742 1.0
 740
 741
 742 743 1.0
 743 744 1.0 745 1.0 746 1.0
 744
 745
 746
 747 748 2.0 749 1.5
 748
 749 750 1.0 751 1.0
 750
 751 752 1.0 753 1.0 766 1.0
 752
 753 754 1.0 755 1.0 759 1.0
 754
 755 756 1.0 757 1.0 758 1.0
 756
 757
 758
 759 760 1.0 761 1.0 762 1.0
 760
 761
 762 763 1.0 764 1.0 765 1.0
 763
 764
 765
 766 767 2.0 768 1.5
 767
 768 769 1.0 770 1.0
 769
 770 771 1.0 772 1.0 773 1.0
 771
 772
 773 774 2.0 775 1.5
 774
 775 776 1.0 777 1.0
 776
 777 778 1.0 779 1.0 780 1.0
 778
 779
 780 781 2.0 782 1.5
 781
 782 783 1.0 784 1.0
 783
 784 785 1.0 786 1.0 799 1.0
 785
 786 787 1.0 788 1.0 792 1.0
 787
 788 789 1.0 790 1.0 791 1.0
 789
 790
 791
 792 793 1.0 794 1.0 795 1.0
 793
 794
 795 796 1.0 797 1.0 798 1.0
 796
 797
 798
 799 800 2.0 801 1.5
 800
 801 802 1.0 803 1.0
 802
 803 804 1.0 805 1.0 806 1.0
 804
 805
 806 807 2.0 808 1.5
 807
 808 809 1.0 810 1.0
 809
 810 811 1.0 812 1.0 813 1.0
 811
 812
 813 814 2.0 815 1.5
 814
 815 816 1.0 817 1.0
 816
 817 818 1.0 819 1.0 833 1.0
 818
 819 820 1.0 821 1.0 822 1.0
 820
 821
 822 823 1.5 831 1.5
 823 824 1.0 825 1.5
 824
 825 826 1.0 827 1.5
 826
 827 828 1.0 829 1.5
 828
 829 830 1.0 831 1.5
 830
 831 832 1.0
 832
 833 834 2.0 835 1.5
 834
 835 836 1.0 837 1.0
 836
 837 838 1.0 839 1.0 852 1.0
 838
 839 840 1.0 841 1.0 845 1.0
 840
 841 842 1.0 843 1.0 844 1.0
 842
 843
 844
 845 846 1.0 847 1.0 848 1.0
 846
 847
 848 849 1.0 850 1.0 851 1.0
 849
 850
 851
 852 853 2.0 854 1.5
 853
 854 855 1.0 856 1.0
 855
 856 857 1.0 858 1.0 874 1.0
 857
 858 859 1.0 860 1.0 861 1.0
 859
 860
 861 862 1.0 863 1.0 864 1.0
 862
 863
 864 865 1.0 866 1.0 867 1.0
 865
 866
 867 868 1.0 869 1.0 870 1.0
 868
 869
 870 871 1.0 872 1.0 873 1.0
 871
 872
 873
 874 875 2.0 876 1.5
 875
 876 877 1.0 878 1.0
 877
 878 879 1.0 880 1.0 890 1.0
 879
 880 881 1.0 882 1.0 886 1.0
 881
 882 883 1.0 884 1.0 885 1.0
 883
 884
 885
 886 887 1.0 888 1.0 889 1.0
 887
 888
 889
 890 891 2.0 892 1.5
 891
 892 893 1.0 894 1.0
 893
 894 895 1.0 896 1.0 914 1.0
 895
 896 897 1.0 898 1.0 899 1.0
 897
 898
 899 900 1.0 901 1.0 902 1.0
 900
 901
 902 903 1.0 904 1.0 905 1.0
 903
 904
 905 906 1.0 907 2.0
 906
 907 908 2.0 911 2.0
 908 909 1.0 910 1.0
 909
 910
 911 912 1.0 913 1.0
 912
 913
 914 915 2.0 916 1.5
 915
 916 917 1.0 918 1.0
 917
 918 919 1.0 920 1.0 931 1.0
 919
 920 921 1.0 922 1.0 923 1.0
 921
 922
 923 924 1.0 925 1.0 926 1.0
 924
 925
 926 927 2.0 928 2.0
 927
 928 929 1.0 930 1.0
 929
 930
 931 932 2.0 933 1.5
 932
 933 934 1.0 935 1.0
 934
 935 936 1.0 937 1.0 952 1.0
 936
 937 938 1.0 939 1.0 940 1.0
 938
 939
 940 941 1.5 950 1.5
 941 942 1.0 943 1.5
 942
 943 944 1.0 945 1.5
 944
 945 946 1.0 948 1.5
 946 947 1.0
 947
 948 949 1.0 950 1.5
 949
 950 951 1.0
 951
 952 953 2.0 954 1.5
 953
 954 955 1.0 956 1.0
 955
 956 957 1.0 958 1.0 964 1.0
 957
 958 959 1.0 960 1.0 961 1.0
 959
 960
 961 962 2.0 963 2.0
 962
 963
 964 965 2.0 966 1.5
 965
 966 967 1.0 968 1.0
 967
 968 969 1.0 970 1.0 981 1.0
 969
 970 971 1.0 972 1.0 973 1.0
 971
 972
 973 974 1.0 975 1.0 976 1.0
 974
 975
 976 977 2.0 978 2.0
 977
 978 979 1.0 980 1.0
 979
 980
 981 982 2.0 983 1.5
 982
 983 984 1.0 985 1.0
 984
 985 986 1.0 987 1.0 1000 1.0
 986
 987 988 1.0 989 1.0 993 1.0
 988
 989 990 1.0 991 1.0 992 1.0
 990
 991
 992
 993 994 1.0 995 1.0 996 1.0
 994
 995
 996 997 1.0 998 1.0 999 1.0
 997
 998
 999
 1000 1001 2.0 1002 1.5
 1001
 1002 1003 1.0 1012 1.0
 1003 1004 1.0 1005 1.0 1006 1.0
 1004
 1005
 1006 1007 1.0 1008 1.0 1009 1.0
 1007
 1008
 1009 1010 1.0 1011 1.0 1012 1.0
 1010
 1011
 1012 1013 1.0 1014 1.0
 1013
 1014 1015 2.0 1016 1.5
 1015
 1016 1017 1.0 1018 1.0
 1017
 1018 1019 1.0 1020 1.0 1030 1.0
 1019
 1020 1021 1.0 1022 1.0 1026 1.0
 1021
 1022 1023 1.0 1024 1.0 1025 1.0
 1023
 1024
 1025
 1026 1027 1.0 1028 1.0 1029 1.0
 1027
 1028
 1029
 1030 1031 2.0 1032 1.5
 1031
 1032 1033 1.0 1034 1.0
 1033
 1034 1035 1.0 1036 1.0 1045 1.0
 1035
 1036 1037 1.0 1038 1.0 1039 1.0
 1037
 1038
 1039 1040 1.0 1041 1.0 1042 1.0
 1040
 1041
 1042 1043 2.0 1044 2.0
 1043
 1044
 1045 1046 2.0 1047 1.5
 1046
 1047 1048 1.0 1049 1.0
 1048
 1049 1050 1.0 1051 1.0 1064 1.0
 1050
 1051 1052 1.0 1053 1.0 1057 1.0
 1052
 1053 1054 1.0 1055 1.0 1056 1.0
 1054
 1055
 1056
 1057 1058 1.0 1059 1.0 1060 1.0
 1058
 1059
 1060 1061 1.0 1062 1.0 1063 1.0
 1061
 1062
 1063
 1064 1065 2.0 1066 1.5
 1065
 1066 1067 1.0 1068 1.0
 1067
 1068 1069 1.0 1070 1.0 1074 1.0
 1069
 1070 1071 1.0 1072 1.0 1073 1.0
 1071
 1072
 1073
 1074 1075 2.0 1076 1.5
 1075
 1076 1077 1.0 1078 1.0
 1077
 1078 1079 1.0 1080 1.0 1081 1.0
 1079
 1080
 1081 1082 2.0 1083 1.5
 1082
 1083 1084 1.0 1085 1.0
 1084
 1085 1086 1.0 1087 1.0 1098 1.0
 1086
 1087 1088 1.0 1089 1.0 1090 1.0
 1088
 1089
 1090 1091 1.0 1096 2.0
 1091 1092 1.5
 1092 1093 1.0 1094 1.5
 1093
 1094 1095 1.0 1096 1.5
 1095
 1096 1097 1.0
 1097
 1098 1099 2.0 1100 1.5
 1099
 1100 1101 1.0 1102 1.0
 1101
 1102 1103 1.0 1104 1.0 1120 1.0
 1103
 1104 1105 1.0 1106 1.0 1107 1.0
 1105
 1106
 1107 1108 1.0 1109 1.0 1110 1.0
 1108
 1109
 1110 1111 1.0 1112 1.0 1113 1.0
 1111
 1112
 1113 1114 1.0 1115 1.0 1116 1.0
 1114
 1115
 1116 1117 1.0 1118 1.0 1119 1.0
 1117
 1118
 1119
 1120 1121 2.0 1122 1.5
 1121
 1122 1123 1.0 1124 1.0
 1123
 1124 1125 1.0 1126 1.0 1130 1.0
 1125
 1126 1127 1.0 1128 1.0 1129 1.0
 1127
 1128
 1129
 1130 1131 2.0 1132 1.5
 1131
 1132 1133 1.0 1134 1.0
 1133
 1134 1135 1.0 1136 1.0 1149 1.0
 1135
 1136 1137 1.0 1138 1.0 1142 1.0
 1137
 1138 1139 1.0 1140 1.0 1141 1.0
 1139
 1140
 1141
 1142 1143 1.0 1144 1.0 1145 1.0
 1143
 1144
 1145 1146 1.0 1147 1.0 1148 1.0
 1146
 1147
 1148
 1149 1150 2.0 1151 1.5
 1150
 1151 1152 1.0 1153 1.0
 1152
 1153 1154 1.0 1155 1.0 1156 1.0
 1154
 1155
 1156 1157 2.0 1158 1.5
 1157
 1158 1159 1.0 1160 1.0
 1159
 1160 1161 1.0 1162 1.0 1170 1.0
 1161
 1162 1163 1.0 1164 1.0 1168 1.0
 1163
 1164 1165 1.0 1166 1.0 1167 1.0
 1165
 1166
 1167
 1168 1169 1.0
 1169
 1170 1171 2.0 1172 1.5
 1171
 1172 1173 1.0 1174 1.0
 1173
 1174 1175 1.0 1176 1.0 1186 1.0
 1175
 1176 1177 1.0 1178 1.0 1182 1.0
 1177
 1178 1179 1.0 1180 1.0 1181 1.0
 1179
 1180
 1181
 1182 1183 1.0 1184 1.0 1185 1.0
 1183
 1184
 1185
 1186 1187 2.0 1188 1.5
 1187
 1188 1189 1.0 1190 1.0
 1189
 1190 1191 1.0 1192 1.0 1205 1.0
 1191
 1192 1193 1.0 1194 1.0 1195 1.0
 1193
 1194
 1195 1196 1.0 1197 1.0 1201 1.0
 1196
 1197 1198 1.0 1199 1.0 1200 1.0
 1198
 1199
 1200
 1201 1202 1.0 1203 1.0 1204 1.0
 1202
 1203
 1204
 1205 1206 2.0 1207 1.5
 1206
 1207 1208 1.0 1209 1.0
 1208
 1209 1210 1.0 1211 1.0 1221 1.0
 1210
 1211 1212 1.0 1213 1.0 1217 1.0
 1212
 1213 1214 1.0 1215 1.0 1216 1.0
 1214
 1215
 1216
 1217 1218 1.0 1219 1.0 1220 1.0
 1218
 1219
 1220
 1221 1222 2.0 1223 1.5
 1222
 1223 1224 1.0 1225 1.0
 1224
 1225 1226 1.0 1227 1.0 1228 1.0
 1226
 1227
 1228 1229 2.0 1230 1.5
 1229
 1230 1231 1.0 1240 1.0
 1231 1232 1.0 1233 1.0 1234 1.0
 1232
 1233
 1234 1235 1.0 1236 1.0 1237 1.0
 1235
 1236
 1237 1238 1.0 1239 1.0 1240 1.0
 1238
 1239
 1240 1241 1.0 1242 1.0
 1241
 1242 1243 2.0 1244 1.5
 1243
 1244 1245 1.0 1246 1.0
 1245
 1246 1247 1.0 1248 1.0 1256 1.0
 1247
 1248 1249 1.0 1250 1.0 1254 1.0
 1249
 1250 1251 1.0 1252 1.0 1253 1.0
 1251
 1252
 1253
 1254 1255 1.0
 1255
 1256 1257 2.0 1258 1.5
 1257
 1258 1259 1.0 1268 1.0
 1259 1260 1.0 1261 1.0 1262 1.0
 1260
 1261
 1262 1263 1.0 1264 1.0 1265 1.0
 1263
 1264
 1265 1266 1.0 1267 1.0 1268 1.0
 1266
 1267
 1268 1269 1.0 1270 1.0
 1269
 1270 1271 2.0 1272 1.5
 1271
 1272 1273 1.0 1274 1.0
 1273
 1274 1275 1.0 1276 1.0 1286 1.0
 1275
 1276 1277 1.0 1278 1.0 1282 1.0
 1277
 1278 1279 1.0 1280 1.0 1281 1.0
 1279
 1280
 1281
 1282 1283 1.0 1284 1.0 1285 1.0
 1283
 1284
 1285
 1286 1287 2.0 1288 1.5
 1287
 1288 1289 1.0 1290 1.0
 1289
 1290 1291 1.0 1292 1.0 1300 1.0
 1291
 1292 1293 1.0 1294 1.0 1295 1.0
 1293
 1294
 1295 1296 2.0 1297 2.0
 1296
 1297 1298 1.0 1299 1.0
 1298
 1299
 1300 1301 2.0 1302 1.5
 1301
 1302 1303 1.0 1304 1.0
 1303
 1304 1305 1.0 1306 1.0 1319 1.0
 1305
 1306 1307 1.0 1308 1.0 1312 1.0
 1307
 1308 1309 1.0 1310 1.0 1311 1.0
 1309
 1310
 1311
 1312 1313 1.0 1314 1.0 1315 1.0
 1313
 1314
 1315 1316 1.0 1317 1.0 1318 1.0
 1316
 1317
 1318
 1319 1320 2.0 1321 1.5
 1320
 1321 1322 1.0 1323 1.0
 1322
 1323 1324 1.0 1325 1.0 1338 1.0
 1324
 1325 1326 1.0 1327 1.0 1331 1.0
 1326
 1327 1328 1.0 1329 1.0 1330 1.0
 1328
 1329
 1330
 1331 1332 1.0 1333 1.0 1334 1.0
 1332
 1333
 1334 1335 1.0 1336 1.0 1337 1.0
 1335
 1336
 1337
 1338 1339 2.0 1340 1.5
 1339
 1340 1341 1.0 1342 1.0
 1341
 1342 1343 1.0 1344 1.0 1345 1.0
 1343
 1344
 1345 1346 2.0 1347 1.5
 1346
 1347 1348 1.0 1349 1.0
 1348
 1349 1350 1.0 1351 1.0 1369 1.0
 1350
 1351 1352 1.0 1353 1.0 1354 1.0
 1352
 1353
 1354 1355 1.0 1356 1.0 1357 1.0
 1355
 1356
 1357 1358 1.0 1359 1.0 1360 1.0
 1358
 1359
 1360 1361 1.0 1362 2.0
 1361
 1362 1363 2.0 1366 2.0
 1363 1364 1.0 1365 1.0
 1364
 1365
 1366 1367 1.0 1368 1.0
 1367
 1368
 1369 1370 2.0 1371 1.5
 1370
 1371 1372 1.0 1373 1.0
 1372
 1373 1374 1.0 1375 1.0 1383 1.0
 1374
 1375 1376 1.0 1377 1.0 1378 1.0
 1376
 1377
 1378 1379 2.0 1380 2.0
 1379
 1380 1381 1.0 1382 1.0
 1381
 1382
 1383 1384 2.0 1385 1.5
 1384
 1385 1386 1.0 1387 1.0
 1386
 1387 1388 1.0 1389 1.0 1402 1.0
 1388
 1389 1390 1.0 1391 1.0 1392 1.0
 1390
 1391
 1392 1393 1.0 1394 1.0 1398 1.0
 1393
 1394 1395 1.0 1396 1.0 1397 1.0
 1395
 1396
 1397
 1398 1399 1.0 1400 1.0 1401 1.0
 1399
 1400
 1401
 1402 1403 2.0 1404 1.5
 1403
 1404 1405 1.0 1406 1.0
 1405
 1406 1407 1.0 1408 1.0 1421 1.0
 1407
 1408 1409 1.0 1410 1.0 1411 1.0
 1409
 1410
 1411 1412 1.0 1413 1.0 1417 1.0
 1412
 1413 1414 1.0 1415 1.0 1416 1.0
 1414
 1415
 1416
 1417 1418 1.0 1419 1.0 1420 1.0
 1418
 1419
 1420
 1421 1422 2.0 1423 1.5
 1422
 1423 1424 1.0 1425 1.0
 1424
 1425 1426 1.0 1427 1.0 1435 1.0
 1426
 1427 1428 1.0 1429 1.0 1433 1.0
 1428
 1429 1430 1.0 1431 1.0 1432 1.0
 1430
 1431
 1432
 1433 1434 1.0
 1434
 1435 1436 2.0 1437 1.5
 1436
 1437 1438 1.0 1439 1.0
 1438
 1439 1440 1.0 1441 1.0 1452 1.0
 1440
 1441 1442 1.0 1443 1.0 1444 1.0
 1442
 1443
 1444 1445 1.0 1446 1.0 1447 1.0
 1445
 1446
 1447 1448 2.0 1449 2.0
 1448
 1449 1450 1.0 1451 1.0
 1450
 1451
 1452 1453 2.0 1454 1.5
 1453
 1454 1455 1.0 1456 1.0
 1455
 1456 1457 1.0 1458 1.0 1471 1.0
 1457
 1458 1459 1.0 1460 1.0 1464 1.0
 1459
 1460 1461 1.0 1462 1.0 1463 1.0
 1461
 1462
 1463
 1464 1465 1.0 1466 1.0 1467 1.0
 1465
 1466
 1467 1468 1.0 1469 1.0 1470 1.0
 1468
 1469
 1470
 1471 1472 2.0 1473 1.5
 1472
 1473 1474 1.0 1475 1.0
 1474
 1475 1476 1.0 1477 1.0 1478 1.0
 1476
 1477
 1478 1479 2.0 1480 1.5
 1479
 1480 1481 1.0 1482 1.0
 1481
 1482 1483 1.0 1484 1.0 1488 1.0
 1483
 1484 1485 1.0 1486 1.0 1487 1.0
 1485
 1486
 1487
 1488 1489 2.0 1490 1.5
 1489
 1490 1491 1.0 1492 1.0
 1491
 1492 1493 1.0 1494 1.0 1502 1.0
 1493
 1494 1495 1.0 1496 1.0 1500 1.0
 1495
 1496 1497 1.0 1498 1.0 1499 1.0
 1497
 1498
 1499
 1500 1501 1.0
 1501
 1502 1503 2.0 1504 1.5
 1503
 1504 1505 1.0 1506 1.0
 1505
 1506 1507 1.0 1508 1.0 1521 1.0
 1507
 1508 1509 1.0 1510 1.0 1511 1.0
 1509
 1510
 1511 1512 1.0 1513 1.0 1517 1.0
 1512
 1513 1514 1.0 1515 1.0 1516 1.0
 1514
 1515
 1516
 1517 1518 1.0 1519 1.0 1520 1.0
 1518
 1519
 1520
 1521 1522 2.0 1523 1.5
 1522
 1523 1524 1.0 1525 1.0
 1524
 1525 1526 1.0 1527 1.0 1535 1.0
 1526
 1527 1528 1.0 1529 1.0 1530 1.0
 1528
 1529
 1530 1531 2.0 1532 2.0
 1531
 1532 1533 1.0 1534 1.0
 1533
 1534
 1535 1536 2.0 1537 1.5
 1536
 1537 1538 1.0 1539 1.0
 1538
 1539 1540 1.0 1541 1.0 1555 1.0
 1540
 1541 1542 1.0 1543 1.0 1544 1.0
 1542
 1543
 1544 1545 1.5 1553 1.5
 1545 1546 1.0 1547 1.5
 1546
 1547 1548 1.0 1549 1.5
 1548
 1549 1550 1.0 1551 1.5
 1550
 1551 1552 1.0 1553 1.5
 1552
 1553 1554 1.0
 1554
 1555 1556 2.0 1557 2.0
 1556
 1557
 1558 1559 1.0 1560 1.0 1561 1.0 1570 1.0
 1559
 1560
 1561 1562 1.0 1563 1.0 1564 1.0
 1562
 1563
 1564 1565 1.0 1566 1.0 1567 1.0
 1565
 1566
 1567 1568 1.0 1569 1.0 1570 1.0
 1568
 1569
 1570 1571 1.0 1572 1.0
 1571
 1572 1573 2.0 1574 1.5
 1573
 1574 1575 1.0 1576 1.0
 1575
 1576 1577 1.0 1578 1.0 1589 1.0
 1577
 1578 1579 1.0 1580 1.0 1581 1.0
 1579
 1580
 1581 1582 1.0 1583 1.0 1584 1.0
 1582
 1583
 1584 1585 2.0 1586 2.0
 1585
 1586 1587 1.0 1588 1.0
 1587
 1588
 1589 1590 2.0 1591 1.5
 1590
 1591 1592 1.0 1593 1.0
 1592
 1593 1594 1.0 1595 1.0 1608 1.0
 1594
 1595 1596 1.0 1597 1.0 1601 1.0
 1596
 1597 1598 1.0 1599 1.0 1600 1.0
 1598
 1599
 1600
 1601 1602 1.0 1603 1.0 1604 1.0
 1602
 1603
 1604 1605 1.0 1606 1.0 1607 1.0
 1605
 1606
 1607
 1608 1609 2.0 1610 1.5
 1609
 1610 1611 1.0 1612 1.0
 1611
 1612 1613 1.0 1614 1.0 1622 1.0
 1613
 1614 1615 1.0 1616 1.0 1620 1.0
 1615
 1616 1617 1.0 1618 1.0 1619 1.0
 1617
 1618
 1619
 1620 1621 1.0
 1621
 1622 1623 2.0 1624 1.5
 1623
 1624 1625 1.0 1626 1.0
 1625
 1626 1627 1.0 1628 1.0 1641 1.0
 1627
 1628 1629 1.0 1630 1.0 1631 1.0
 1629
 1630
 1631 1632 1.0 1633 1.0 1637 1.0
 1632
 1633 1634 1.0 1635 1.0 1636 1.0
 1634
 1635
 1636
 1637 1638 1.0 1639 1.0 1640 1.0
 1638
 1639
 1640
 1641 1642 2.0 1643 1.5
 1642
 1643 1644 1.0 1645 1.0
 1644
 1645 1646 1.0 1647 1.0 1665 1.0
 1646
 1647 1648 1.0 1649 1.0 1650 1.0
 1648
 1649
 1650 1651 2.0 1664 1.0
 1651 1652 1.0 1653 1.0
 1652
 1653 1654 1.0 1655 1.5
 1654
 1655 1656 1.5 1664 1.5
 1656 1657 1.0 1658 1.5
 1657
 1658 1659 1.0 1660 1.5
 1659
 1660 1661 1.0 1662 1.5
 1661
 1662 1663 1.0 1664 1.5
 1663
 1664
 1665 1666 2.0 1667 1.5
 1666
 1667 1668 1.0 1669 1.0
 1668
 1669 1670 1.0 1671 1.0 1682 1.0
 1670
 1671 1672 1.0 1673 1.0 1674 1.0
 1672
 1673
 1674 1675 1.0 1676 1.0 1677 1.0
 1675
 1676
 1677 1678 2.0 1679 2.0
 1678
 1679 1680 1.0 1681 1.0
 1680
 1681
 1682 1683 2.0 1684 1.5
 1683
 1684 1685 1.0 1686 1.0
 1685
 1686 1687 1.0 1688 1.0 1706 1.0
 1687
 1688 1689 1.0 1690 1.0 1691 1.0
 1689
 1690
 1691 1692 1.0 1693 1.0 1694 1.0
 1692
 1693
 1694 1695 1.0 1696 1.0 1697 1.0
 1695
 1696
 1697 1698 1.0 1699 2.0
 1698
 1699 1700 2.0 1703 2.0
 1700 1701 1.0 1702 1.0
 1701
 1702
 1703 1704 1.0 1705 1.0
 1704
 1705
 1706 1707 2.0 1708 1.5
 1707
 1708 1709 1.0 1718 1.0
 1709 1710 1.0 1711 1.0 1712 1.0
 1710
 1711
 1712 1713 1.0 1714 1.0 1715 1.0
 1713
 1714
 1715 1716 1.0 1717 1.0 1718 1.0
 1716
 1717
 1718 1719 1.0 1720 1.0
 1719
 1720 1721 2.0 1722 1.5
 1721
 1722 1723 1.0 1724 1.0
 1723
 1724 1725 1.0 1726 1.0 1739 1.0
 1725
 1726 1727 1.0 1728 1.0 1729 1.0
 1727
 1728
 1729 1730 1.0 1731 1.0 1735 1.0
 1730
 1731 1732 1.0 1733 1.0 1734 1.0
 1732
 1733
 1734
 1735 1736 1.0 1737 1.0 1738 1.0
 1736
 1737
 1738
 1739 1740 2.0 1741 1.5
 1740
 1741 1742 1.0 1743 1.0
 1742
 1743 1744 1.0 1745 1.0 1755 1.0
 1744
 1745 1746 1.0 1747 1.0 1751 1.0
 1746
 1747 1748 1.0 1749 1.0 1750 1.0
 1748
 1749
 1750
 1751 1752 1.0 1753 1.0 1754 1.0
 1752
 1753
 1754
 1755 1756 2.0 1757 1.5
 1756
 1757 1758 1.0 1759 1.0
 1758
 1759 1760 1.0 1761 1.0 1769 1.0
 1760
 1761 1762 1.0 1763 1.0 1767 1.0
 1762
 1763 1764 1.0 1765 1.0 1766 1.0
 1764
 1765
 1766
 1767 1768 1.0
 1768
 1769 1770 2.0 1771 1.5
 1770
 1771 1772 1.0 1773 1.0
 1772
 1773 1774 1.0 1775 1.0 1788 1.0
 1774
 1775 1776 1.0 1777 1.0 1781 1.0
 1776
 1777 1778 1.0 1779 1.0 1780 1.0
 1778
 1779
 1780
 1781 1782 1.0 1783 1.0 1784 1.0
 1782
 1783
 1784 1785 1.0 1786 1.0 1787 1.0
 1785
 1786
 1787
 1788 1789 2.0 1790 1.5
 1789
 1790 1791 1.0 1792 1.0
 1791
 1792 1793 1.0 1794 1.0 1812 1.0
 1793
 1794 1795 1.0 1796 1.0 1797 1.0
 1795
 1796
 1797 1798 1.0 1799 1.0 1800 1.0
 1798
 1799
 1800 1801 1.0 1802 1.0 1803 1.0
 1801
 1802
 1803 1804 1.0 1805 1.5
 1804
 1805 1806 2.0 1809 2.0
 1806 1807 1.0 1808 1.0
 1807
 1808
 1809 1810 1.0 1811 1.0
 1810
 1811
 1812 1813 2.0 1814 1.5
 1813
 1814 1815 1.0 1816 1.0
 1815
 1816 1817 1.0 1818 1.0 1831 1.0
 1817
 1818 1819 1.0 1820 1.0 1824 1.0
 1819
 1820 1821 1.0 1822 1.0 1823 1.0
 1821
 1822
 1823
 1824 1825 1.0 1826 1.0 1827 1.0
 1825
 1826
 1827 1828 1.0 1829 1.0 1830 1.0
 1828
 1829
 1830
 1831 1832 2.0 1833 1.5
 1832
 1833 1834 1.0 1835 1.0
 1834
 1835 1836 1.0 1837 1.0 1838 1.0
 1836
 1837
 1838 1839 2.0 1840 1.5
 1839
 1840 1841 1.0 1842 1.0
 1841
 1842 1843 1.0 1844 1.0 1845 1.0
 1843
 1844
 1845 1846 2.0 1847 1.5
 1846
 1847 1848 1.0 1849 1.0
 1848
 1849 1850 1.0 1851 1.0 1862 1.0
 1850
 1851 1852 1.0 1853 1.0 1854 1.0
 1852
 1853
 1854 1855 1.0 1856 1.0 1857 1.0
 1855
 1856
 1857 1858 2.0 1859 2.0
 1858
 1859 1860 1.0 1861 1.0
 1860
 1861
 1862 1863 2.0 1864 1.5
 1863
 1864 1865 1.0 1866 1.0
 1865
 1866 1867 1.0 1868 1.0 1881 1.0
 1867
 1868 1869 1.0 1870 1.0 1871 1.0
 1869
 1870
 1871 1872 1.0 1873 1.0 1877 1.0
 1872
 1873 1874 1.0 1875 1.0 1876 1.0
 1874
 1875
 1876
 1877 1878 1.0 1879 1.0 1880 1.0
 1878
 1879
 1880
 1881 1882 2.0 1883 1.5
 1882
 1883 1884 1.0 1885 1.0
 1884
 1885 1886 1.0 1887 1.0 1903 1.0
 1886
 1887 1888 1.0 1889 1.0 1890 1.0
 1888
 1889
 1890 1891 1.0 1892 1.0 1893 1.0
 1891
 1892
 1893 1894 1.0 1895 1.0 1896 1.0
 1894
 1895
 1896 1897 1.0 1898 1.0 1899 1.0
 1897
 1898
 1899 1900 1.0 1901 1.0 1902 1.0
 1900
 1901
 1902
 1903 1904 2.0 1905 1.5
 1904
 1905 1906 1.0 1907 1.0
 1906
 1907 1908 1.0 1909 1.0 1918 1.0
 1908
 1909 1910 1.0 1911 1.0 1912 1.0
 1910
 1911
 1912 1913 1.0 1914 1.0 1915 1.0
 1913
 1914
 1915 1916 2.0 1917 2.0
 1916
 1917
 1918 1919 2.0 1920 1.5
 1919
 1920 1921 1.0 1922 1.0
 1921
 1922 1923 1.0 1924 1.0 1928 1.0
 1923
 1924 1925 1.0 1926 1.0 1927 1.0
 1925
 1926
 1927
 1928 1929 2.0 1930 1.5
 1929
 1930 1931 1.0 1932 1.0
 1931
 1932 1933 1.0 1934 1.0 1947 1.0
 1933
 1934 1935 1.0 1936 1.0 1937 1.0
 1935
 1936
 1937 1938 1.0 1939 1.0 1943 1.0
 1938
 1939 1940 1.0 1941 1.0 1942 1.0
 1940
 1941
 1942
 1943 1944 1.0 1945 1.0 1946 1.0
 1944
 1945
 1946
 1947 1948 2.0 1949 1.5
 1948
 1949 1950 1.0 1951 1.0
 1950
 1951 1952 1.0 1953 1.0 1966 1.0
 1952
 1953 1954 1.0 1955 1.0 1956 1.0
 1954
 1955
 1956 1957 1.0 1958 1.0 1962 1.0
 1957
 1958 1959 1.0 1960 1.0 1961 1.0
 1959
 1960
 1961
 1962 1963 1.0 1964 1.0 1965 1.0
 1963
 1964
 1965
 1966 1967 2.0 1968 1.5
 1967
 1968 1969 1.0 1970 1.0
 1969
 1970 1971 1.0 1972 1.0 1979 1.0
 1971
 1972 1973 1.0 1974 1.0 1975 1.0
 1973
 1974
 1975 1976 2.0 1977 2.0
 1976
 1977
 1978 3167 1.0
 1979 1980 2.0 1981 1.5
 1980
 1981 1982 1.0 1983 1.0
 1982
 1983 1984 1.0 1985 1.0 1993 1.0
 1984
 1985 1986 1.0 1987 1.0 1991 1.0
 1986
 1987 1988 1.0 1989 1.0 1990 1.0
 1988
 1989
 1990
 1991 1992 1.0
 1992
 1993 1994 2.0 1995 1.5
 1994
 1995 1996 1.0 1997 1.0
 1996
 1997 1998 1.0 1999 1.0 2000 1.0
 1998
 1999
 2000 2001 2.0 2002 1.5
 2001
 2002 2003 1.0 2004 1.0
 2003
 2004 2005 1.0 2006 1.0 2010 1.0
 2005
 2006 2007 1.0 2008 1.0 2009 1.0
 2007
 2008
 2009
 2010 2011 2.0 2012 1.5
 2011
 2012 2013 1.0 2014 1.0
 2013
 2014 2015 1.0 2016 1.0 2022 1.0
 2015
 2016 2017 1.0 2018 1.0 2019 1.0
 2017
 2018
 2019 2020 2.0 2021 2.0
 2020
 2021
 2022 2023 2.0 2024 1.5
 2023
 2024 2025 1.0 2026 1.0
 2025
 2026 2027 1.0 2028 1.0 2034 1.0
 2027
 2028 2029 1.0 2030 1.0 2031 1.0
 2029
 2030
 2031 2032 2.0 2033 2.0
 2032
 2033
 2034 2035 2.0 2036 1.5
 2035
 2036 2037 1.0 2038 1.0
 2037
 2038 2039 1.0 2040 1.0 2048 1.0
 2039
 2040 2041 1.0 2042 1.0 2046 1.0
 2041
 2042 2043 1.0 2044 1.0 2045 1.0
 2043
 2044
 2045
 2046 2047 1.0
 2047
 2048 2049 2.0 2050 1.5
 2049
 2050 2051 1.0 2052 1.0
 2051
 2052 2053 1.0 2054 1.0 2064 1.0
 2053
 2054 2055 1.0 2056 1.0 2060 1.0
 2055
 2056 2057 1.0 2058 1.0 2059 1.0
 2057
 2058
 2059
 2060 2061 1.0 2062 1.0 2063 1.0
 2061
 2062
 2063
 2064 2065 2.0 2066 1.5
 2065
 2066 2067 1.0 2068 1.0
 2067
 2068 2069 1.0 2070 1.0 2083 1.0
 2069
 2070 2071 1.0 2072 1.0 2073 1.0
 2071
 2072
 2073 2074 1.0 2075 1.0 2079 1.0
 2074
 2075 2076 1.0 2077 1.0 2078 1.0
 2076
 2077
 2078
 2079 2080 1.0 2081 1.0 2082 1.0
 2080
 2081
 2082
 2083 2084 2.0 2085 1.5
 2084
 2085 2086 1.0 2087 1.0
 2086
 2087 2088 1.0 2089 1.0 2098 1.0
 2088
 2089 2090 1.0 2091 1.0 2092 1.0
 2090
 2091
 2092 2093 1.0 2094 1.0 2095 1.0
 2093
 2094
 2095 2096 2.0 2097 2.0
 2096
 2097
 2098 2099 2.0 2100 1.5
 2099
 2100 2101 1.0 2102 1.0
 2101
 2102 2103 1.0 2104 1.0 2113 1.0
 2103
 2104 2105 1.0 2106 1.0 2107 1.0
 2105
 2106
 2107 2108 1.0 2109 1.0 2110 1.0
 2108
 2109
 2110 2111 2.0 2112 2.0
 2111
 2112
 2113 2114 2.0 2115 1.5
 2114
 2115 2116 1.0 2117 1.0
 2116
 2117 2118 1.0 2119 1.0 2130 1.0
 2118
 2119 2120 1.0 2121 1.0 2122 1.0
 2120
 2121
 2122 2123 1.0 2124 1.0 2125 1.0
 2123
 2124
 2125 2126 1.0
 2126 2127 1.0 2128 1.0 2129 1.0
 2127
 2128
 2129
 2130 2131 2.0 2132 1.5
 2131
 2132 2133 1.0 2134 1.0
 2133
 2134 2135 1.0 2136 1.0 2144 1.0
 2135
 2136 2137 1.0 2138 1.0 2139 1.0
 2137
 2138
 2139 2140 2.0 2141 2.0
 2140
 2141 2142 1.0 2143 1.0
 2142
 2143
 2144 2145 2.0 2146 1.5
 2145
 2146 2147 1.0 2148 1.0
 2147
 2148 2149 1.0 2150 1.0 2163 1.0
 2149
 2150 2151 1.0 2152 1.0 2153 1.0
 2151
 2152
 2153 2154 1.0 2155 1.0 2159 1.0
 2154
 2155 2156 1.0 2157 1.0 2158 1.0
 2156
 2157
 2158
 2159 2160 1.0 2161 1.0 2162 1.0
 2160
 2161
 2162
 2163 2164 2.0 2165 1.5
 2164
 2165 2166 1.0 2175 1.0
 2166 2167 1.0 2168 1.0 2169 1.0
 2167
 2168
 2169 2170 1.0 2171 1.0 2172 1.0
 2170
 2171
 2172 2173 1.0 2174 1.0 2175 1.0
 2173
 2174
 2175 2176 1.0 2177 1.0
 2176
 2177 2178 2.0 2179 1.5
 2178
 2179 2180 1.0 2181 1.0
 2180
 2181 2182 1.0 2183 1.0 2184 1.0
 2182
 2183
 2184 2185 2.0 2186 1.5
 2185
 2186 2187 1.0 2188 1.0
 2187
 2188 2189 1.0 2190 1.0 2206 1.0
 2189
 2190 2191 1.0 2192 1.0 2193 1.0
 2191
 2192
 2193 2194 1.0 2195 1.0 2196 1.0
 2194
 2195
 2196 2197 1.0 2198 1.0 2199 1.0
 2197
 2198
 2199 2200 1.0 2201 1.0 2202 1.0
 2200
 2201
 2202 2203 1.0 2204 1.0 2205 1.0
 2203
 2204
 2205
 2206 2207 2.0 2208 1.5
 2207
 2208 2209 1.0 2210 1.0
 2209
 2210 2211 1.0 2212 1.0 2230 1.0
 2211
 2212 2213 1.0 2214 1.0 2215 1.0
 2213
 2214
 2215 2216 2.0 2229 1.0
 2216 2217 1.0 2218 1.0
 2217
 2218 2219 1.0 2220 1.5
 2219
 2220 2221 1.5 2229 1.5
 2221 2222 1.0 2223 1.5
 2222
 2223 2224 1.0 2225 1.5
 2224
 2225 2226 1.0 2227 1.5
 2226
 2227 2228 1.0 2229 1.5
 2228
 2229
 2230 2231 2.0 2232 1.5
 2231
 2232 2233 1.0 2234 1.0
 2233
 2234 2235 1.0 2236 1.0 2252 1.0
 2235
 2236 2237 1.0 2238 1.0 2239 1.0
 2237
 2238
 2239 2240 1.0 2241 1.0 2242 1.0
 2240
 2241
 2242 2243 1.0 2244 1.0 2245 1.0
 2243
 2244
 2245 2246 1.0 2247 1.0 2248 1.0
 2246
 2247
 2248 2249 1.0 2250 1.0 2251 1.0
 2249
 2250
 2251
 2252 2253 2.0 2254 1.5
 2253
 2254 2255 1.0 2264 1.0
 2255 2256 1.0 2257 1.0 2258 1.0
 2256
 2257
 2258 2259 1.0 2260 1.0 2261 1.0
 2259
 2260
 2261 2262 1.0 2263 1.0 2264 1.0
 2262
 2263
 2264 2265 1.0 2266 1.0
 2265
 2266 2267 2.0 2268 1.5
 2267
 2268 2269 1.0 2270 1.0
 2269
 2270 2271 1.0 2272 1.0 2288 1.0
 2271
 2272 2273 1.0 2274 1.0 2275 1.0
 2273
 2274
 2275 2276 1.0 2277 1.0 2278 1.0
 2276
 2277
 2278 2279 1.0 2280 1.0 2281 1.0
 2279
 2280
 2281 2282 1.0 2283 1.0 2284 1.0
 2282
 2283
 2284 2285 1.0 2286 1.0 2287 1.0
 2285
 2286
 2287
 2288 2289 2.0 2290 1.5
 2289
 2290 2291 1.0 2292 1.0
 2291
 2292 2293 1.0 2294 1.0 2305 1.0
 2293
 2294 2295 1.0 2296 1.0 2297 1.0
 2295
 2296
 2297 2298 1.0 2299 1.0 2300 1.0
 2298
 2299
 2300 2301 1.0
 2301 2302 1.0 2303 1.0 2304 1.0
 2302
 2303
 2304
 2305 2306 2.0 2307 1.5
 2306
 2307 2308 1.0 2309 1.0
 2308
 2309 2310 1.0 2311 1.0 2324 1.0
 2310
 2311 2312 1.0 2313 1.0 2317 1.0
 2312
 2313 2314 1.0 2315 1.0 2316 1.0
 2314
 2315
 2316
 2317 2318 1.0 2319 1.0 2320 1.0
 2318
 2319
 2320 2321 1.0 2322 1.0 2323 1.0
 2321
 2322
 2323
 2324 2325 2.0 2326 1.5
 2325
 2326 2327 1.0 2328 1.0
 2327
 2328 2329 1.0 2330 1.0 2331 1.0
 2329
 2330
 2331 2332 2.0 2333 1.5
 2332
 2333 2334 1.0 2335 1.0
 2334
 2335 2336 1.0 2337 1.0 2338 1.0
 2336
 2337
 2338 2339 2.0 2340 1.5
 2339
 2340 2341 1.0 2342 1.0
 2341
 2342 2343 1.0 2344 1.0 2357 1.0
 2343
 2344 2345 1.0 2346 1.0 2350 1.0
 2345
 2346 2347 1.0 2348 1.0 2349 1.0
 2347
 2348
 2349
 2350 2351 1.0 2352 1.0 2353 1.0
 2351
 2352
 2353 2354 1.0 2355 1.0 2356 1.0
 2354
 2355
 2356
 2357 2358 2.0 2359 1.5
 2358
 2359 2360 1.0 2361 1.0
 2360
 2361 2362 1.0 2363 1.0 2364 1.0
 2362
 2363
 2364 2365 2.0 2366 1.5
 2365
 2366 2367 1.0 2368 1.0
 2367
 2368 2369 1.0 2370 1.0 2371 1.0
 2369
 2370
 2371 2372 2.0 2373 1.5
 2372
 2373 2374 1.0 2375 1.0
 2374
 2375 2376 1.0 2377 1.0 2391 1.0
 2376
 2377 2378 1.0 2379 1.0 2380 1.0
 2378
 2379
 2380 2381 1.5 2389 1.5
 2381 2382 1.0 2383 1.5
 2382
 2383 2384 1.0 2385 1.5
 2384
 2385 2386 1.0 2387 1.5
 2386
 2387 2388 1.0 2389 1.5
 2388
 2389 2390 1.0
 2390
 2391 2392 2.0 2393 1.5
 2392
 2393 2394 1.0 2395 1.0
 2394
 2395 2396 1.0 2397 1.0 2410 1.0
 2396
 2397 2398 1.0 2399 1.0 2403 1.0
 2398
 2399 2400 1.0 2401 1.0 2402 1.0
 2400
 2401
 2402
 2403 2404 1.0 2405 1.0 2406 1.0
 2404
 2405
 2406 2407 1.0 2408 1.0 2409 1.0
 2407
 2408
 2409
 2410 2411 2.0 2412 1.5
 2411
 2412 2413 1.0 2414 1.0
 2413
 2414 2415 1.0 2416 1.0 2432 1.0
 2415
 2416 2417 1.0 2418 1.0 2419 1.0
 2417
 2418
 2419 2420 1.0 2421 1.0 2422 1.0
 2420
 2421
 2422 2423 1.0 2424 1.0 2425 1.0
 2423
 2424
 2425 2426 1.0 2427 1.0 2428 1.0
 2426
 2427
 2428 2429 1.0 2430 1.0 2431 1.0
 2429
 2430
 2431
 2432 2433 2.0 2434 1.5
 2433
 2434 2435 1.0 2436 1.0
 2435
 2436 2437 1.0 2438 1.0 2448 1.0
 2437
 2438 2439 1.0 2440 1.0 2444 1.0
 2439
 2440 2441 1.0 2442 1.0 2443 1.0
 2441
 2442
 2443
 2444 2445 1.0 2446 1.0 2447 1.0
 2445
 2446
 2447
 2448 2449 2.0 2450 1.5
 2449
 2450 2451 1.0 2452 1.0
 2451
 2452 2453 1.0 2454 1.0 2472 1.0
 2453
 2454 2455 1.0 2456 1.0 2457 1.0
 2455
 2456
 2457 2458 1.0 2459 1.0 2460 1.0
 2458
 2459
 2460 2461 1.0 2462 1.0 2463 1.0
 2461
 2462
 2463 2464 1.0 2465 2.0
 2464
 2465 2466 2.0 2469 2.0
 2466 2467 1.0 2468 1.0
 2467
 2468
 2469 2470 1.0 2471 1.0
 2470
 2471
 2472 2473 2.0 2474 1.5
 2473
 2474 2475 1.0 2476 1.0
 2475
 2476 2477 1.0 2478 1.0 2489 1.0
 2477
 2478 2479 1.0 2480 1.0 2481 1.0
 2479
 2480
 2481 2482 1.0 2483 1.0 2484 1.0
 2482
 2483
 2484 2485 2.0 2486 2.0
 2485
 2486 2487 1.0 2488 1.0
 2487
 2488
 2489 2490 2.0 2491 1.5
 2490
 2491 2492 1.0 2493 1.0
 2492
 2493 2494 1.0 2495 1.0 2510 1.0
 2494
 2495 2496 1.0 2497 1.0 2498 1.0
 2496
 2497
 2498 2499 1.5 2508 1.5
 2499 2500 1.0 2501 1.5
 2500
 2501 2502 1.0 2503 1.5
 2502
 2503 2504 1.0 2506 1.5
 2504 2505 1.0
 2505
 2506 2507 1.0 2508 1.5
 2507
 2508 2509 1.0
 2509
 2510 2511 2.0 2512 1.5
 2511
 2512 2513 1.0 2514 1.0
 2513
 2514 2515 1.0 2516 1.0 2522 1.0
 2515
 2516 2517 1.0 2518 1.0 2519 1.0
 2517
 2518
 2519 2520 2.0 2521 2.0
 2520
 2521
 2522 2523 2.0 2524 1.5
 2523
 2524 2525 1.0 2526 1.0
 2525
 2526 2527 1.0 2528 1.0 2539 1.0
 2527
 2528 2529 1.0 2530 1.0 2531 1.0
 2529
 2530
 2531 2532 1.0 2533 1.0 2534 1.0
 2532
 2533
 2534 2535 2.0 2536 2.0
 2535
 2536 2537 1.0 2538 1.0
 2537
 2538
 2539 2540 2.0 2541 1.5
 2540
 2541 2542 1.0 2543 1.0
 2542
 2543 2544 1.0 2545 1.0 2558 1.0
 2544
 2545 2546 1.0 2547 1.0 2551 1.0
 2546
 2547 2548 1.0 2549 1.0 2550 1.0
 2548
 2549
 2550
 2551 2552 1.0 2553 1.0 2554 1.0
 2552
 2553
 2554 2555 1.0 2556 1.0 2557 1.0
 2555
 2556
 2557
 2558 2559 2.0 2560 1.5
 2559
 2560 2561 1.0 2570 1.0
 2561 2562 1.0 2563 1.0 2564 1.0
 2562
 2563
 2564 2565 1.0 2566 1.0 2567 1.0
 2565
 2566
 2567 2568 1.0 2569 1.0 2570 1.0
 2568
 2569
 2570 2571 1.0 2572 1.0
 2571
 2572 2573 2.0 2574 1.5
 2573
 2574 2575 1.0 2576 1.0
 2575
 2576 2577 1.0 2578 1.0 2588 1.0
 2577
 2578 2579 1.0 2580 1.0 2584 1.0
 2579
 2580 2581 1.0 2582 1.0 2583 1.0
 2581
 2582
 2583
 2584 2585 1.0 2586 1.0 2587 1.0
 2585
 2586
 2587
 2588 2589 2.0 2590 1.5
 2589
 2590 2591 1.0 2592 1.0
 2591
 2592 2593 1.0 2594 1.0 2603 1.0
 2593
 2594 2595 1.0 2596 1.0 2597 1.0
 2595
 2596
 2597 2598 1.0 2599 1.0 2600 1.0
 2598
 2599
 2600 2601 2.0 2602 2.0
 2601
 2602
 2603 2604 2.0 2605 1.5
 2604
 2605 2606 1.0 2607 1.0
 2606
 2607 2608 1.0 2609 1.0 2622 1.0
 2608
 2609 2610 1.0 2611 1.0 2615 1.0
 2610
 2611 2612 1.0 2613 1.0 2614 1.0
 2612
 2613
 2614
 2615 2616 1.0 2617 1.0 2618 1.0
 2616
 2617
 2618 2619 1.0 2620 1.0 2621 1.0
 2619
 2620
 2621
 2622 2623 2.0 2624 1.5
 2623
 2624 2625 1.0 2626 1.0
 2625
 2626 2627 1.0 2628 1.0 2632 1.0
 2627
 2628 2629 1.0 2630 1.0 2631 1.0
 2629
 2630
 2631
 2632 2633 2.0 2634 1.5
 2633
 2634 2635 1.0 2636 1.0
 2635
 2636 2637 1.0 2638 1.0 2639 1.0
 2637
 2638
 2639 2640 2.0 2641 1.5
 2640
 2641 2642 1.0 2643 1.0
 2642
 2643 2644 1.0 2645 1.0 2656 1.0
 2644
 2645 2646 1.0 2647 1.0 2648 1.0
 2646
 2647
 2648 2649 1.0 2654 2.0
 2649 2650 1.5
 2650 2651 1.0 2652 1.5
 2651
 2652 2653 1.0 2654 1.5
 2653
 2654 2655 1.0
 2655
 2656 2657 2.0 2658 1.5
 2657
 2658 2659 1.0 2660 1.0
 2659
 2660 2661 1.0 2662 1.0 2678 1.0
 2661
 2662 2663 1.0 2664 1.0 2665 1.0
 2663
 2664
 2665 2666 1.0 2667 1.0 2668 1.0
 2666
 2667
 2668 2669 1.0 2670 1.0 2671 1.0
 2669
 2670
 2671 2672 1.0 2673 1.0 2674 1.0
 2672
 2673
 2674 2675 1.0 2676 1.0 2677 1.0
 2675
 2676
 2677
 2678 2679 2.0 2680 1.5
 2679
 2680 2681 1.0 2682 1.0
 2681
 2682 2683 1.0 2684 1.0 2688 1.0
 2683
 2684 2685 1.0 2686 1.0 2687 1.0
 2685
 2686
 2687
 2688 2689 2.0 2690 1.5
 2689
 2690 2691 1.0 2692 1.0
 2691
 2692 2693 1.0 2694 1.0 2707 1.0
 2693
 2694 2695 1.0 2696 1.0 2700 1.0
 2695
 2696 2697 1.0 2698 1.0 2699 1.0
 2697
 2698
 2699
 2700 2701 1.0 2702 1.0 2703 1.0
 2701
 2702
 2703 2704 1.0 2705 1.0 2706 1.0
 2704
 2705
 2706
 2707 2708 2.0 2709 1.5
 2708
 2709 2710 1.0 2711 1.0
 2710
 2711 2712 1.0 2713 1.0 2714 1.0
 2712
 2713
 2714 2715 2.0 2716 1.5
 2715
 2716 2717 1.0 2718 1.0
 2717
 2718 2719 1.0 2720 1.0 2728 1.0
 2719
 2720 2721 1.0 2722 1.0 2726 1.0
 2721
 2722 2723 1.0 2724 1.0 2725 1.0
 2723
 2724
 2725
 2726 2727 1.0
 2727
 2728 2729 2.0 2730 1.5
 2729
 2730 2731 1.0 2732 1.0
 2731
 2732 2733 1.0 2734 1.0 2744 1.0
 2733
 2734 2735 1.0 2736 1.0 2740 1.0
 2735
 2736 2737 1.0 2738 1.0 2739 1.0
 2737
 2738
 2739
 2740 2741 1.0 2742 1.0 2743 1.0
 2741
 2742
 2743
 2744 2745 2.0 2746 1.5
 2745
 2746 2747 1.0 2748 1.0
 2747
 2748 2749 1.0 2750 1.0 2763 1.0
 2749
 2750 2751 1.0 2752 1.0 2753 1.0
 2751
 2752
 2753 2754 1.0 2755 1.0 2759 1.0
 2754
 2755 2756 1.0 2757 1.0 2758 1.0
 2756
 2757
 2758
 2759 2760 1.0 2761 1.0 2762 1.0
 2760
 2761
 2762
 2763 2764 2.0 2765 1.5
 2764
 2765 2766 1.0 2767 1.0
 2766
 2767 2768 1.0 2769 1.0 2779 1.0
 2768
 2769 2770 1.0 2771 1.0 2775 1.0
 2770
 2771 2772 1.0 2773 1.0 2774 1.0
 2772
 2773
 2774
 2775 2776 1.0 2777 1.0 2778 1.0
 2776
 2777
 2778
 2779 2780 2.0 2781 1.5
 2780
 2781 2782 1.0 2783 1.0
 2782
 2783 2784 1.0 2785 1.0 2786 1.0
 2784
 2785
 2786 2787 2.0 2788 1.5
 2787
 2788 2789 1.0 2798 1.0
 2789 2790 1.0 2791 1.0 2792 1.0
 2790
 2791
 2792 2793 1.0 2794 1.0 2795 1.0
 2793
 2794
 2795 2796 1.0 2797 1.0 2798 1.0
 2796
 2797
 2798 2799 1.0 2800 1.0
 2799
 2800 2801 2.0 2802 1.5
 2801
 2802 2803 1.0 2804 1.0
 2803
 2804 2805 1.0 2806 1.0 2814 1.0
 2805
 2806 2807 1.0 2808 1.0 2812 1.0
 2807
 2808 2809 1.0 2810 1.0 2811 1.0
 2809
 2810
 2811
 2812 2813 1.0
 2813
 2814 2815 2.0 2816 1.5
 2815
 2816 2817 1.0 2826 1.0
 2817 2818 1.0 2819 1.0 2820 1.0
 2818
 2819
 2820 2821 1.0 2822 1.0 2823 1.0
 2821
 2822
 2823 2824 1.0 2825 1.0 2826 1.0
 2824
 2825
 2826 2827 1.0 2828 1.0
 2827
 2828 2829 2.0 2830 1.5
 2829
 2830 2831 1.0 2832 1.0
 2831
 2832 2833 1.0 2834 1.0 2844 1.0
 2833
 2834 2835 1.0 2836 1.0 2840 1.0
 2835
 2836 2837 1.0 2838 1.0 2839 1.0
 2837
 2838
 2839
 2840 2841 1.0 2842 1.0 2843 1.0
 2841
 2842
 2843
 2844 2845 2.0 2846 1.5
 2845
 2846 2847 1.0 2848 1.0
 2847
 2848 2849 1.0 2850 1.0 2858 1.0
 2849
 2850 2851 1.0 2852 1.0 2853 1.0
 2851
 2852
 2853 2854 2.0 2855 2.0
 2854
 2855 2856 1.0 2857 1.0
 2856
 2857
 2858 2859 2.0 2860 1.5
 2859
 2860 2861 1.0 2862 1.0
 2861
 2862 2863 1.0 2864 1.0 2877 1.0
 2863
 2864 2865 1.0 2866 1.0 2870 1.0
 2865
 2866 2867 1.0 2868 1.0 2869 1.0
 2867
 2868
 2869
 2870 2871 1.0 2872 1.0 2873 1.0
 2871
 2872
 2873 2874 1.0 2875 1.0 2876 1.0
 2874
 2875
 2876
 2877 2878 2.0 2879 1.5
 2878
 2879 2880 1.0 2881 1.0
 2880
 2881 2882 1.0 2883 1.0 2896 1.0
 2882
 2883 2884 1.0 2885 1.0 2889 1.0
 2884
 2885 2886 1.0 2887 1.0 2888 1.0
 2886
 2887
 2888
 2889 2890 1.0 2891 1.0 2892 1.0
 2890
 2891
 2892 2893 1.0 2894 1.0 2895 1.0
 2893
 2894
 2895
 2896 2897 2.0 2898 1.5
 2897
 2898 2899 1.0 2900 1.0
 2899
 2900 2901 1.0 2902 1.0 2903 1.0
 2901
 2902
 2903 2904 2.0 2905 1.5
 2904
 2905 2906 1.0 2907 1.0
 2906
 2907 2908 1.0 2909 1.0 2927 1.0
 2908
 2909 2910 1.0 2911 1.0 2912 1.0
 2910
 2911
 2912 2913 1.0 2914 1.0 2915 1.0
 2913
 2914
 2915 2916 1.0 2917 1.0 2918 1.0
 2916
 2917
 2918 2919 1.0 2920 2.0
 2919
 2920 2921 2.0 2924 2.0
 2921 2922 1.0 2923 1.0
 2922
 2923
 2924 2925 1.0 2926 1.0
 2925
 2926
 2927 2928 2.0 2929 1.5
 2928
 2929 2930 1.0 2931 1.0
 2930
 2931 2932 1.0 2933 1.0 2941 1.0
 2932
 2933 2934 1.0 2935 1.0 2936 1.0
 2934
 2935
 2936 2937 2.0 2938 2.0
 2937
 2938 2939 1.0 2940 1.0
 2939
 2940
 2941 2942 2.0 2943 1.5
 2942
 2943 2944 1.0 2945 1.0
 2944
 2945 2946 1.0 2947 1.0 2960 1.0
 2946
 2947 2948 1.0 2949 1.0 2950 1.0
 2948
 2949
 2950 2951 1.0 2952 1.0 2956 1.0
 2951
 2952 2953 1.0 2954 1.0 2955 1.0
 2953
 2954
 2955
 2956 2957 1.0 2958 1.0 2959 1.0
 2957
 2958
 2959
 2960 2961 2.0 2962 1.5
 2961
 2962 2963 1.0 2964 1.0
 2963
 2964 2965 1.0 2966 1.0 2979 1.0
 2965
 2966 2967 1.0 2968 1.0 2969 1.0
 2967
 2968
 2969 2970 1.0 2971 1.0 2975 1.0
 2970
 2971 2972 1.0 2973 1.0 2974 1.0
 2972
 2973
 2974
 2975 2976 1.0 2977 1.0 2978 1.0
 2976
 2977
 2978
 2979 2980 2.0 2981 1.5
 2980
 2981 2982 1.0 2983 1.0
 2982
 2983 2984 1.0 2985 1.0 2993 1.0
 2984
 2985 2986 1.0 2987 1.0 2991 1.0
 2986
 2987 2988 1.0 2989 1.0 2990 1.0
 2988
 2989
 2990
 2991 2992 1.0
 2992
 2993 2994 2.0 2995 1.5
 2994
 2995 2996 1.0 2997 1.0
 2996
 2997 2998 1.0 2999 1.0 3010 1.0
 2998
 2999 3000 1.0 3001 1.0 3002 1.0
 3000
 3001
 3002 3003 1.0 3004 1.0 3005 1.0
 3003
 3004
 3005 3006 2.0 3007 2.0
 3006
 3007 3008 1.0 3009 1.0
 3008
 3009
 3010 3011 2.0 3012 1.5
 3011
 3012 3013 1.0 3014 1.0
 3013
 3014 3015 1.0 3016 1.0 3029 1.0
 3015
 3016 3017 1.0 3018 1.0 3022 1.0
 3017
 3018 3019 1.0 3020 1.0 3021 1.0
 3019
 3020
 3021
 3022 3023 1.0 3024 1.0 3025 1.0
 3023
 3024
 3025 3026 1.0 3027 1.0 3028 1.0
 3026
 3027
 3028
 3029 3030 2.0 3031 1.5
 3030
 3031 3032 1.0 3033 1.0
 3032
 3033 3034 1.0 3035 1.0 3036 1.0
 3034
 3035
 3036 3037 2.0 3038 1.5
 3037
 3038 3039 1.0 3040 1.0
 3039
 3040 3041 1.0 3042 1.0 3046 1.0
 3041
 3042 3043 1.0 3044 1.0 3045 1.0
 3043
 3044
 3045
 3046 3047 2.0 3048 1.5
 3047
 3048 3049 1.0 3050 1.0
 3049
 3050 3051 1.0 3052 1.0 3060 1.0
 3051
 3052 3053 1.0 3054 1.0 3058 1.0
 3053
 3054 3055 1.0 3056 1.0 3057 1.0
 3055
 3056
 3057
 3058 3059 1.0
 3059
 3060 3061 2.0 3062 1.5
 3061
 3062 3063 1.0 3064 1.0
 3063
 3064 3065 1.0 3066 1.0 3079 1.0
 3065
 3066 3067 1.0 3068 1.0 3069 1.0
 3067
 3068
 3069 3070 1.0 3071 1.0 3075 1.0
 3070
 3071 3072 1.0 3073 1.0 3074 1.0
 3072
 3073
 3074
 3075 3076 1.0 3077 1.0 3078 1.0
 3076
 3077
 3078
 3079 3080 2.0 3081 1.5
 3080
 3081 3082 1.0 3083 1.0
 3082
 3083 3084 1.0 3085 1.0 3093 1.0
 3084
 3085 3086 1.0 3087 1.0 3088 1.0
 3086
 3087
 3088 3089 2.0 3090 2.0
 3089
 3090 3091 1.0 3092 1.0
 3091
 3092
 3093 3094 2.0 3095 1.5
 3094
 3095 3096 1.0 3097 1.0
 3096
 3097 3098 1.0 3099 1.0 3113 1.0
 3098
 3099 3100 1.0 3101 1.0 3102 1.0
 3100
 3101
 3102 3103 1.5 3111 1.5
 3103 3104 1.0 3105 1.5
 3104
 3105 3106 1.0 3107 1.5
 3106
 3107 3108 1.0 3109 1.5
 3108
 3109 3110 1.0 3111 1.5
 3110
 3111 3112 1.0
 3112
 3113 3114 2.0 3115 2.0
 3114
 3115
 3116 3117 1.0 3118 1.0 3119 1.0 3120 1.0
 3117
 3118
 3119
 3120 3121 1.0 3122 1.0 3130 1.0
 3121
 3122 3123 1.0 3124 1.0 3128 1.0
 3123
 3124 3125 1.0 3126 1.0 3127 1.0
 3125
 3126
 3127
 3128 3129 1.0
 3129
 3130 3131 2.0 3132 1.5
 3131
 3132 3133 1.0 3134 1.0
 3133
 3134 3135 1.0 3136 1.0 3149 1.0
 3135
 3136 3137 1.0 3138 1.0 3142 1.0
 3137
 3138 3139 1.0 3140 1.0 3141 1.0
 3139
 3140
 3141
 3142 3143 1.0 3144 1.0 3145 1.0
 3143
 3144
 3145 3146 1.0 3147 1.0 3148 1.0
 3146
 3147
 3148
 3149 3150 2.0 3151 1.5
 3150
 3151 3152 1.0 3153 1.0
 3152
 3153 3154 1.0 3155 1.0 3166 1.0
 3154
 3155 3156 1.0 3157 1.0 3158 1.0
 3156
 3157
 3158 3159 1.0 3160 1.0 3161 1.0
 3159
 3160
 3161 3162 1.0
 3162 3163 1.0 3164 1.0 3165 1.0
 3163
 3164
 3165
 3166 3167 1.0 3168 1.0 3230 1.0
 3167
 3168 3169 1.0 3170 1.0
 3169
 3170 3171 1.0 3172 1.0 3183 1.0
 3171
 3172 3173 1.0 3174 1.0 3175 1.0
 3173
 3174
 3175 3176 1.0 3177 1.0 3178 1.0
 3176
 3177
 3178 3179 1.0
 3179 3180 1.0 3181 1.0 3182 1.0
 3180
 3181
 3182
 3183 3184 2.0 3185 1.5
 3184
 3185 3186 1.0 3187 1.0
 3186
 3187 3188 1.0 3189 1.0 3200 1.0
 3188
 3189 3190 1.0 3191 1.0 3192 1.0
 3190
 3191
 3192 3193 1.0 3194 1.0 3195 1.0
 3193
 3194
 3195 3196 2.0 3197 2.0
 3196
 3197 3198 1.0 3199 1.0
 3198
 3199
 3200 3201 2.0 3202 1.5
 3201
 3202 3203 1.0 3204 1.0
 3203
 3204 3205 1.0 3206 1.0 3224 1.0
 3205
 3206 3207 1.0 3208 1.0 3209 1.0
 3207
 3208
 3209 3210 1.0 3211 1.0 3212 1.0
 3210
 3211
 3212 3213 1.0 3214 1.0 3215 1.0
 3213
 3214
 3215 3216 1.0 3217 2.0
 3216
 3217 3218 2.0 3221 2.0
 3218 3219 1.0 3220 1.0
 3219
 3220
 3221 3222 1.0 3223 1.0
 3222
 3223
 3224 3225 2.0 3226 2.0
 3225
 3226
 3227 3228 1.0 3229 1.0
 3228
 3229
 3230 3232 1.0
 3231
 3232

