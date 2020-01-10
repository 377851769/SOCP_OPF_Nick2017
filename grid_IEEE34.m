
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author: Lucien Bobo
%
% When publishing results based on this data, please cite:
%
% L. Bobo, A. Venzke, S. Chatzivasileiadis, "Second-Order Cone Relaxations
% of the Optimal Power Flow for Active Distribution Grids", 2020. Available
% online: https://arxiv.org/abs/2001.00898
%
% W. H. Kersting, “Radial distribution test feeders,” in Conference
% Proceedings of the 2001 IEEE Power Engineering Society Winter Meeting,
% 2001. vol. 2, pp. 908–912
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function mpc = grid_IEEE34

% Feeder based on IEEE34 with the following simplifications:
% - Regulator considered in table regs with fixed voltage gains
% - Breaker ignored (intermediate bus removed)
% - Distribution grid transformer considered
% - Substation transformer omitted (LV-side perspective)
% - Distributed load equally spread on neighbour buses
% - Capacitors considered in table caps
% - Loads equally distributed on all phases
% + buses relabelled
% + tiny lines resulting from components removal ignored

%% MATPOWER Case Format : Version 2
mpc.version = '2';

%%-----  Power Flow Data  -----%%
%% system MVA base
mpc.baseMVA = 1;

%% bus data
%	bus typ Pd      Qd      Gs      Bs      ar  Vm	Va	baseKV	zon Vmx Vmn
mpc.bus = [
1	1	0.0275	0.0145	0	0	1	1	0	24.9	1	1.2	0.8	;
2	1	0.0275	0.0145	0	0	1	1	0	24.9	1	1.2	0.8	;
3	1	0.0080	0.0040	0	0	1	1	0	24.9	1	1.2	0.8	;
4	1	0.0000	0.0000	0	0	1	1	0	24.9	1	1.2	0.8	;
5	1	0.0000	0.0000	0	0	1	1	0	24.9	1	1.2	0.8	;
6	1	0.4500	0.2250	0	0	1	1	0	4.16	1	1.2	0.8	;
7	1	0.0170	0.0085	0	0	1	1	0	24.9	1	1.2	0.8	;
8	1	0.0245	0.0120	0	0	1	1	0	24.9	1	1.2	0.8	;
9	1	0.0850	0.0435	0	0	1	1	0	24.9	1	1.2	0.8	;
10	1	0.0675	0.0350	0	0	1	1	0	24.9	1	1.2	0.8	;
11	1	0.0055	0.0025	0	0	1	1	0	24.9	1	1.2	0.8	;
12	1	0.0485	0.0215	0	0	1	1	0	24.9	1	1.2	0.8	;
13	1	0.0020	0.0010	0	0	1	1	0	24.9	1	1.2	0.8	;
14	1	0.0245	0.0125	0	0	1	1	0	24.9	1	1.2	0.8	;
15	1	0.1740	0.1060	0	0	1	1	0	24.9	1	1.2	0.8	;
16	1	0.0045	0.0025	0	0	1	1	0	24.9	1	1.2	0.8	;
17	1	0.0470	0.0310	0	0	1	1	0	24.9	1	1.2	0.8	;
18	1	0.0140	0.0070	0	0	1	1	0	24.9	1	1.2	0.8	;
19	1	0.4320	0.3290	0	0	1	1	0	24.9	1	1.2	0.8	;
20	1	0.0340	0.0170	0	0	1	1	0	24.9	1	1.2	0.8	;
21	1	0.0715	0.0535	0	0	1	1	0	24.9	1	1.2	0.8	;
22	1	0.0025	0.0010	0	0	1	1	0	24.9	1	1.2	0.8	;
23	1	0.0075	0.0035	0	0	1	1	0	24.9	1	1.2	0.8	;
24	1	0.0610	0.0315	0	0	1	1	0	24.9	1	1.2	0.8	;
25	1	0.0010	0.0005	0	0	1	1	0	24.9	1	1.2	0.8	;
26	1	0.0890	0.0450	0	0	1	1	0	24.9	1	1.2	0.8	;
27	1	0.0000	0.0000	0	0	1	1	0	4.16	1	1.2	0.8	;
28	1	0.0080	0.0040	0	0	1	1	0	24.9	1	1.2	0.8	;
29	1	0.0200	0.0100	0	0	1	1	0	24.9	1	1.2	0.8	;
30	1	0.0020	0.0010	0	0	1	1	0	24.9	1	1.2	0.8	;
31	1	0.0140	0.0070	0	0	1	1	0	24.9	1	1.2	0.8	;
%32	3	0.0000	0.0000	0	0	1	1.05	0	24.9	1	1.05	1.05	;
32	3	0.0000	0.0000	0	0	1	1	0	24.9	1	1	1	;
];

%% capacitor data
% bus total cap (sum over three phases) [MVAr]
mpc.caps = [
19  0.3
21  0.45
];

%% voltage regulator data
% bus ratio
mpc.regs = [
5   1
23  1
% 5   1.075
% 23  1.09
];

%% generator data
%	bus	Pg	Qg	Qmax	Qmin	Vg	mBase	status	Pmax	Pmin	Pc1	Pc2	Qc1min	Qc1max	Qc2min	Qc2max	ramp_agc	ramp_10	ramp_30	ramp_q	apf
mpc.gen = [
32	0	0	200	-200	1	1	1	200	-200	0	0	0	0	0	0	0	0	0	0	0	;
1	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
2	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
3	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
6	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
7	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
8	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
9	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
10	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
11	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
12	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
13	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
14	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
15	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
16	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
17	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
18	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
19	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
20	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
21	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
22	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
23	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
24	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
25	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
26	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
28	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
29	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
30	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
31	0	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	;
];

%% branch data
%	fbus	tbus	r	x	b	rateA	rateB	rateC	ratio	angle	status	angmin	angmax
mpc.branch = [
32	1	0.001053546	0.001051576	0.00161628857	0	0	0	0	0	1	-360	360	;
1	2	0.000706448	0.000705126	0.00108379040	0	0	0	0	0	1	-360	360	;
2	3	0.013161159	0.013136546	0.02019107774	0	0	0	0	0	1	-360	360	;
3	4	0.015313169	0.015284532	0.02349256641	0	0	0	0	0	1	-360	360	;
4	5	0.012140281	0.012117577	0.01862490665	0	0	0	0	0	1	-360	360	;
27	6	0.154493343	0.154204419	0.00018465075	0	0	0	0	0	1	-360	360	;
22	7	0.001462325	0.000775954	0.00084839456	0	0	0	0	0	1	-360	360	;
22	8	0.006019362	0.004402243	0.00613931401	0	0	0	0	0	1	-360	360	;
7	9	0.041175999	0.021849240	0.02388900468	0	0	0	0	0	1	-360	360	;
9	10	0.011749911	0.006234861	0.00681692470	0	0	0	0	0	1	-360	360	;
8	11	0.000495227	0.000362183	0.00050509537	0	0	0	0	0	1	-360	360	;
11	12	0.012050514	0.008813109	0.01229065410	0	0	0	0	0	1	-360	360	;
12	13	0.000306569	0.000224208	0.00031267809	0	0	0	0	0	1	-360	360	;
23	14	0.002888822	0.002112732	0.00294638968	0	0	0	0	0	1	-360	360	;
26	15	0.001190902	0.000870963	0.00121463411	0	0	0	0	0	1	-360	360	;
26	16	0.000165076	0.000120728	0.00016836512	0	0	0	0	0	1	-360	360	;
24	17	0.000507018	0.000370806	0.00051712145	0	0	0	0	0	1	-360	360	;
24	18	0.000165076	0.000120728	0.00016836512	0	0	0	0	0	1	-360	360	;
16	19	0.000795900	0.000582079	0.00081176042	0	0	0	0	0	1	-360	360	;
19	20	0.002145982	0.001569458	0.00218874662	0	0	0	0	0	1	-360	360	;
20	21	0.000312464	0.000228520	0.00031869113	0	0	0	0	0	1	-360	360	;
5	22	0.000182762	0.000133663	0.00018640425	0	0	0	0	0	1	-360	360	;
13	23	0.021713329	0.015879981	0.02214602693	0	0	0	0	0	1	-360	360	;
15	24	0.001580009	0.001155535	0.00161149476	0	0	0	0	0	1	-360	360	;
14	25	0.001385361	0.000735115	0.00080374221	0	0	0	0	0	1	-360	360	;
14	26	0.003437109	0.002513720	0.00350560242	0	0	0	0	0	1	-360	360	;
23	27	0.038000000	0.081600000	0.00000000000	0	0	0	0	0	1	-360	360	;
3	28	0.004963354	0.002633707	0.00287958013	0	0	0	0	0	1	-360	360	;
8	29	0.002591138	0.001374937	0.00150329562	0	0	0	0	0	1	-360	360	;
13	30	0.019950905	0.010586558	0.01157488015	0	0	0	0	0	1	-360	360	;
18	31	0.002852918	0.002109885	0.00249032442	0	0	0	0	0	1	-360	360	;
];


%%-----  OPF Data  -----%%
%% generator cost data
%	1	startup	shutdown	n	x1	y1	...	xn	yn
%	2	startup	shutdown	n	c(n-1)	...	c0
mpc.gencost = ...
           [2	0	0	3	0	1   0;...
ones(28,1)*[2	0	0	3	0   0   0]];
