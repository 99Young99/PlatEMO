addpath("D:\Code_file\PlatEMO\PlatEMO");

platemo();

platemo('algorithm', @MOPSO, 'problem', @DTLZ1, 'M', 3, 'D', 3, 'N', 100);

platemo('algorithm', @CSO, 'problem',@SOP_F1, 'N', 100);

platemo('algorithm', @MOPSOPCCS, 'problem', @DTLZ1, 'M', 3, 'D', 3, 'N', 100);

platemo('algorithm', @CheckPccs, 'problem', @DTLZ1, 'M', 3, 'D', 3, 'N', 100);

platemo('algorithm', @SECSO, 'problem', @SMOP1, 'M', 3, 'D', 3, 'N', 100);





