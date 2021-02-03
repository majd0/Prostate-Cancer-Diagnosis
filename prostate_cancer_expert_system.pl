%EXPERT SYSTEM FOR DIAGNOSING PROSTATE CANCER
%

diagnose:-
    write('************************************************************************'),nl,
    writeln('**  >> WELCOME TO THE PROSTATE CANCER DIAGNOSTIC EXPERT SYSTEM <<     **'),
    writeln('**                                                                    **'),
    write('**     Please answer following questions in order to diagnose you!    **'),
    nl,
    write('************************************************************************'),nl,
    writeln('------------------------------------------------------------------------'),
    writeln('Are you experiencing frequent urinations? (yes/no): '),
    read(X),
    answer_q1(X).


answer_q1(Ans):-
        Ans == yes,
        writeln('Have you noticed blood in urine? (yes/no): '),
        read(X),
        answer_q4(X).

answer_q1(Ans):-
       Ans == no,
       writeln('Is there pain while urinating? (yes/no): '),
       read(X),
       answer_q2(X);
       Ans == yes,
       Ans = no,
       answer_q3(Ans).


answer_q2(Ans):-
    Ans == no,
    writeln('Are you experiencing difficulties when urinating? (yes/no): '),
    read(X),
    answer_q3(X);
    Ans == yes,
    Ans = no,
    answer_q3(Ans).

answer_q3(Ans):-
    Ans == no,
    writeln('Have you noticed blood in urine? (yes/no): '),
    read(X),
    answer_q4(X);
    Ans = yes,
    writeln('Have you noticed blood in urine? (yes/no): '),
    read(X),
    answer_q4(X).

answer_q4(Ans):-
    Ans == no,
    writeln('Are you experiencing weak urination flow? [takes long time to urinate] (yes/no): '),
    read(X),
    answer_q5(X);
    Ans == yes,
    writeln('Have you experienced unexpected weight loss? (yes/no): '),
    read(X),
    answer_q7(X).

answer_q5(Ans):-
    Ans == no,
    writeln('Do you feel unexpected pain back, hips and other bones? (yes/no): '),
    read(X),
    answer_q6(X);
    Ans == yes,
    writeln('Do you feel unexpected pain back, hips and other bones? (yes/no): '),
    read(X),
    answer_q6(X).

answer_q6(Ans):-
    Ans == no,
    nl,
    write('****************************************************'),nl,
    write('Prostate Cancer Risk Level: '),
    writeln(' -->> NO RISK <<--'),
    write('****************************************************'),nl,
    end_system;
    Ans == yes,
    answer_q4(Ans).

answer_q7(Ans):-
    Ans == no,nl,
    write('****************************************************'),nl,
    writeln('Diagnose:           -->> VISIT DOCTOR <<--'),
    write('****************************************************'),nl,
    end_system;
    Ans == yes,
    writeln('Have you experienced swelling or fluid buildup in the legs or feet? (yes/no): '),
    read(X),
    answer_q8(X).

answer_q8(Ans):-
    Ans == no,nl,
    write('****************************************************'),nl,
    writeln('Diagnose:           -->> VISIT DOCTOR <<--'),
    write('****************************************************'),nl,
    end_system;
    Ans == yes,
    writeln('Do you feel discomfort while sitting? (yes/no): '),
    read(X),
    answer_q9(X).

answer_q9(Ans):-
    Ans == no,
    nl,
    write('****************************************************'),nl,
    writeln('Diagnose:           -->> VISIT DOCTOR <<--'),
    write('****************************************************'),nl,
    end_system;
    Ans == yes,
    writeln('How old are you? [20 - 100]  '),
    read(Age),
    writeln('What is your prostate volume [20 - 120]? '),
    read(PV),
    writeln('What is your PSA (Prostate Specific Antigen) [0 - 50]? '),
    read(PSA),
    prostate_cancer_diagnose(Age, PV, PSA).


prostate_cancer_diagnose(Age, PV, PSA):-
%---------------------------------------------------%
    % VERY LOW RISK LEVEL
    % Rule 1, #1
    Age >=20, Age =<30,    PAge = vy,
    PV >=20, PV =<30,      PPV = vs,
    PSA >=0, PSA =<10,     PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 2, #2
    Age >=20, Age =<30,     PAge = vy,
    PV >=20, PV =<30,       PPV = vs,
    PSA >=11, PSA =<20,     PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 6, #3
    Age >=20, Age =<30,     PAge = vy,
    PV >=31, PV =<40,       PPV = s,
    PSA >=0, PSA =<10,      PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 7, #4
    Age >=20, Age =<30,     PAge = vy,
    PV >=31, PV =<40,       PPV = s,
    PSA >=11, PSA =<20,     PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 11, #5
    Age >=20, Age =<30,    PAge = vy,
    PV >=41, PV =<80,      PPV = me,
    PSA >=0, PSA =<10,    PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 12, #6
    Age >=20, Age =<30,    PAge = vy,
    PV >=41, PV =<80,      PPV = me,
    PSA >=11, PSA =<20,    PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 21, #7
    Age >=20, Age =<30,    PAge = vy,
    PV >=101, PV =<120,    PPV = vla,
    PSA >=0, PSA =<10,     PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 26, #8
    Age >=31, Age =<40,    PAge = y,
    PV >=20, PV =<30,      PPV = vs,
    PSA >=0, PSA =<10,     PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 27, #9
    Age >=31, Age =<40,    PAge = y,
    PV >=20, PV =<30,      PPV = vs,
    PSA >=11, PSA =<20,    PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 31, #10
    Age >=31, Age =<40,    PAge = y,
    PV >=31, PV =<40,      PPV = s,
    PSA >=0, PSA =<10,     PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 32, #11
    Age >=31, Age =<40,    PAge = y,
    PV >=31, PV =<40,      PPV = s,
    PSA >=11, PSA =<20,    PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 36, #12
    Age >=31, Age =<40,    PAge = y,
    PV >=41, PV =<80,      PPV = me,
    PSA >=0, PSA =<10,     PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 41, #13
    Age >=31, Age =<40,    PAge = y,
    PV >=81, PV =<100,     PPV = la,
    PSA >=0, PSA =<10,     PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 46, #14
    Age >=31, Age =<40,    PAge = y,
    PV >=101, PV =<120,    PPV = vla,
    PSA >=0, PSA =<10,    PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 51, #15
    Age >=41, Age =<60,    PAge = ma,
    PV >=20, PV =<30,      PPV = vs,
    PSA >=0, PSA =<10,    PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 56, #16
    Age >=41, Age =<60,    PAge = ma,
    PV >=31, PV =<40,      PPV = s,
    PSA >=0, PSA =<10,    PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 61, #17
    Age >=41, Age =<60,   PAge = ma,
    PV >=41, PV =<80,     PPV = me,
    PSA >=0, PSA =<10,    PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 76, #18
    Age >=61, Age =<80,   PAge = o,
    PV >=20, PV =<30,     PPV = vs,
    PSA >=0, PSA =<10,    PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;
%---------------------------------------------------%

%---------------------------------------------------%
    % LOW RISK LEVEL
    % Rule 3, #19
    Age >=20, Age =<30,   PAge = vy,
    PV >=20, PV =<30,     PPV = vs,
    PSA >=21, PSA =<30,    PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 8, #20
    Age >=20, Age =<30,   PAge = vy,
    PV >=31, PV =<40,     PPV = s,
    PSA >=21, PSA =<30,   PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 13, #21
    Age >=20, Age =<30,   PAge = vy,
    PV >=41, PV =<80,     PPV = me,
    PSA >=21, PSA =<30,   PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 16, #22
    Age >=20, Age =<30,   PAge = vy,
    PV >=81, PV =<100,    PPV = la,
    PSA >=0, PSA =<10,   PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 17, #23
    Age >=20, Age =<30,   PAge = vy,
    PV >=81, PV =<100,    PPV = la,
    PSA >=11, PSA =<20,   PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 22, #24
    Age >=20, Age =<30,   PAge = vy,
    PV >=101, PV =<120,    PPV = vla,
    PSA >=11, PSA =<20,   PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 28, #25
    Age >=31, Age =<40,   PAge = y,
    PV >=20, PV =<30,     PPV = vs,
    PSA >=21, PSA =<30,   PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 33, #26
    Age >=31, Age =<40,   PAge = y,
    PV >=31, PV =<40,     PPV = s,
    PSA >=21, PSA =<30,   PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 37, #27
    Age >=31, Age =<40,   PAge = y,
    PV >=41, PV =<80,     PPV = me,
    PSA >=11, PSA =<20,   PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 42, #28
    Age >=31, Age =<40,   PAge = y,
    PV >=81, PV =<100,    PPV = la,
    PSA >=11, PSA =<20,   PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 47, #29
    Age >=31, Age =<40,   PAge = y,
    PV >=101, PV =<120,   PPV = vla,
    PSA >=11, PSA =<20,   PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 52, #30
    Age >=41, Age =<60,   PAge = ma,
    PV >=20, PV =<30,     PPV = vs,
    PSA >=11, PSA =<20,   PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 53, #31
    Age >=41, Age =<60,   PAge = ma,
    PV >=20, PV =<30,     PPV = vs,
    PSA >=21, PSA =<30,   PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 57, #32
    Age >=41, Age =<60,   PAge = ma,
    PV >=31, PV =<40,     PPV = s,
    PSA >=11, PSA =<20,   PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 62, #33
    Age >=41, Age =<60,   PAge = ma,
    PV >=41, PV =<80,     PPV = me,
    PSA >=11, PSA =<20,   PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 66, #34
    Age >=41, Age =<60,   PAge = ma,
    PV >=81, PV =<100,    PPV = la,
    PSA >=0, PSA =<10,   PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 71, #35
    Age >=41, Age =<60,   PAge = ma,
    PV >=101, PV =<120,   PPV = vla,
    PSA >=0, PSA =<10,   PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 77, #36
    Age >=61, Age =<80,   PAge = o,
    PV >=20, PV =<30,     PPV = vs,
    PSA >=11, PSA =<20,   PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 81, #37
    Age >=61, Age =<80,   PAge = o,
    PV >=31, PV =<40,     PPV = s,
    PSA >=0, PSA =<10,    PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 82, #38
    Age >=61, Age =<80,   PAge = o,
    PV >=31, PV =<40,     PPV = s,
    PSA >=11, PSA =<20,   PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 86, #39
    Age >=61, Age =<80,   PAge = o,
    PV >=41, PV =<80,     PPV = me,
    PSA >=0, PSA =<10,    PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

   % Rule 87, #40
    Age >=61, Age =<80,   PAge = o,
    PV >=41, PV =<80,     PPV = me,
    PSA >=11, PSA =<20,    PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 91, #41
    Age >=61, Age =<80,   PAge = o,
    PV >=81, PV =<100,    PPV = vla,
    PSA >=0, PSA =<10,    PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 101, #42
    Age >=81, Age =<100,  PAge = vo,
    PV >=20, PV =<30,     PPV = vs,
    PSA >=0, PSA =<10,    PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 102, #43
    Age >=81, Age =<100,  PAge = vo,
    PV >=20, PV =<30,     PPV = vs,
    PSA >=11, PSA =<20,   PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 106, #44
    Age >=81, Age =<100,  PAge = vo,
    PV >=31, PV =<40,     PPV = s,
    PSA >=0, PSA =<10,    PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;
%---------------------------------------------------%


%---------------------------------------------------%
    % MEDIUM RISK LEVEL
    % Rule 4, #45
    Age >=20, Age =<30,  PAge = vy,
    PV >=20, PV =<30,    PPV = vs,
    PSA >=31, PSA =<40,  PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 5, #46
    Age >=20, Age =<30,  PAge = vy,
    PV >=20, PV =<30,    PPV = vs,
    PSA >=41, PSA =<50,  PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 9, #47
    Age >=20, Age =<30,  PAge = vy,
    PV >=31, PV =<40,    PPV = s,
    PSA >=31, PSA =<40,  PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 10, #48
    Age >=20, Age =<30,  PAge = vy,
    PV >=31, PV =<40,    PPV = ss,
    PSA >=41, PSA =<50,  PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 14, #49
    Age >=20, Age =<30,  PAge = vy,
    PV >=41, PV =<80,    PPV = me,
    PSA >=31, PSA =<40,  PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 18, #50
    Age >=20, Age =<30,  PAge = vy,
    PV >=81, PV =<100,   PPV = la,
    PSA >=21, PSA =<30,  PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 19, #51
    Age >=20, Age =<30,  PAge = vy,
    PV >=81, PV =<100,   PPV = la,
    PSA >=31, PSA =<40,  PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 23, #52
    Age >=20, Age =<30,  PAge = vy,
    PV >=101, PV =<120,  PPV = vla,
    PSA >=21, PSA =<30,  PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 29, #53
    Age >=31, Age =<40,  PAge = y,
    PV >=20, PV =<30,    PPV = vs,
    PSA >=31, PSA =<40,  PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 34, #54
    Age >=31, Age =<40,  PAge = y,
    PV >=31, PV =<40,    PPV = s,
    PSA >=31, PSA =<40,  PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 38, #55
    Age >=31, Age =<40,  PAge = y,
    PV >=41, PV =<80,    PPV = me,
    PSA >=21, PSA =<30,  PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 39, #56
    Age >=31, Age =<40,  PAge = y,
    PV >=41, PV =<80,    PPV = me,
    PSA >=31, PSA =<40,  PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 43, #57
    Age >=31, Age =<40,  PAge = y,
    PV >=81, PV =<100,   PPV = la,
    PSA >=21, PSA =<30,  PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 44, #58
    Age >=31, Age =<40,  PAge = y,
    PV >=81, PV =<100,   PPV = la,
    PSA >=31, PSA =<40,  PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 48, #59
    Age >=31, Age =<40,  PAge = y,
    PV >=101, PV =<120,  PPV = vla,
    PSA >=21, PSA =<30,  PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

   % Rule 49, #60
    Age >=31, Age =<40,  PAge = y,
    PV >=101, PV =<120,  PPV = vla,
    PSA >=31, PSA =<40,  PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 54, #61
    Age >=41, Age =<60,  PAge = ma,
    PV >=20, PV =<30,    PPV = vs,
    PSA >=31, PSA =<40,  PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 58, #62
    Age >=41, Age =<60,  PAge = ma,
    PV >31, PV =<40,     PPV = s,
    PSA >=21, PSA =<30,  PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 63, #63
    Age >=41, Age =<60,  PAge = ma,
    PV >=41, PV =<80,    PPV = me,
    PSA >=21, PSA =<30,  PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 67, #64
    Age >=41, Age =<60,  PAge = ma,
    PV >=81, PV =<100,   PPV = la,
    PSA >=11, PSA =<20,  PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 72, #65
    Age >=41, Age =<60,  PAge = ma,
    PV >=101, PV =<120,  PPV = vla,
    PSA >=11, PSA =<20,  PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 78, #66
    Age >=61, Age =<80,  PAge = o,
    PV >=20, PV =<30,    PPV = vs,
    PSA >=21, PSA =<30,  PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 83, #67
    Age >=61, Age =<80,  PAge = o,
    PV >=31, PV =<40,    PPV = s,
    PSA >=21, PSA =<30,  PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 88, #68
    Age >=61, Age =<80,  PAge = o,
    PV >=41, PV =<80,    PPV = me,
    PSA >=21, PSA =<30,  PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 92, #69
    Age >=61, Age =<80,  PAge = o,
    PV >=81, PV =<100,   PPV = la,
    PSA >=11, PSA =<20,  PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 96, #70
    Age >=61, Age =<80,  PAge = o,
    PV >=101, PV =<120,  PPV = vla,
    PSA >=0, PSA =<10,   PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 97, #71
    Age >=61, Age =<80,  PAge = o,
    PV >=101, PV =<120,  PPV = vla,
    PSA >=11, PSA =<20,  PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 103, #72
    Age >=81, Age =<100, PAge = vo,
    PV >=20, PV =<30,    PPV = vs,
    PSA >=21, PSA =<30,  PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 104, #73
    Age >=81, Age =<100, PAge = vo,
    PV >=20, PV =<30,    PPV = vs,
    PSA >=31, PSA =<40,  PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 107, #74
    Age >=81, Age =<100, PAge = vo,
    PV >=31, PV =<40,    PPV = s,
    PSA >=11, PSA =<20,  PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 108, #75
    Age >=81, Age =<100, PAge = vo,
    PV >=31, PV =<40,    PPV = s,
    PSA >=21, PSA =<30,  PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 111, #76
    Age >=81, Age =<100, PAge = vo,
    PV >=41, PV =<80,    PPV = me,
    PSA >=0, PSA =<10,   PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 112, #77
    Age >=81, Age =<100, PAge = vo,
    PV >=41, PV =<80,    PPV = me,
    PSA >=11, PSA =<20,  PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 116, #78
    Age >=81, Age =<100, PAge = vo,
    PV >=81, PV =<100,   PPV = la,
    PSA >=0, PSA =<10,  PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 117, #79
    Age >=81, Age =<100, PAge = vo,
    PV >=81, PV =<100,   PPV = la,
    PSA >=11, PSA =<20,  PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 121, #80
    Age >=81, Age =<100, PAge = vo,
    PV >=81, PV =<100,   PPV = la,
    PSA >=0, PSA =<10,  PPSA = vlo,
    risk_level(PAge,PPV,PPSA),
    end_system;
%---------------------------------------------------%


%---------------------------------------------------%
    % HIGH RISK LEVEL
    % Rule 15, #81
    Age >=20, Age =<30,  PAge = vy,
    PV >=41, PV =<80,    PPV = me,
    PSA >=41, PSA =<50,  PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 20, #82
    Age >=20, Age =<30,  PAge = vy,
    PV >=81, PV =<100,   PPV = la,
    PSA >=41, PSA =<50,  PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 24, #83
    Age >=20, Age =<30,  PAge = vy,
    PV >=101, PV =<120,  PPV = vla,
    PSA >=31, PSA =<40,  PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 25, #84
    Age >=20, Age =<30,  PAge = vy,
    PV >=101, PV =<120,  PPV = vla,
    PSA >=41, PSA =<50,  PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 30, #85
    Age >=31, Age =<40,  PAge = y,
    PV >=20, PV =<30,    PPV = vs,
    PSA >=41, PSA =<50,  PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 35, #86
    Age >=31, Age =<40,  PAge = y,
    PV >=31, PV =<40,    PPV = s,
    PSA >=41, PSA =<50,  PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 40, #87
    Age >=31, Age =<40,  PAge = y,
    PV >=41, PV =<80,    PPV = me,
    PSA >=41, PSA =<50,  PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 45, #88
    Age >=31, Age =<40,  PAge = y,
    PV >=81, PV =<100,   PPV = la,
    PSA >=41, PSA =<50,  PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 50, #89
    Age >=31, Age =<40,  PAge = y,
    PV >=101, PV =<120,  PPV = vla,
    PSA >=41, PSA =<50,  PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 55, #90
    Age >=41, Age =<60,  PAge = ma,
    PV >=20, PV =<30,    PPV = vs,
    PSA >=41, PSA =<50,  PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 59, #91
    Age >=41, Age =<60,  PAge = ma,
    PV >=31, PV =<40,    PPV = s,
    PSA >=31, PSA =<40,  PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 60, #92
    Age >=41, Age =<60,  PAge = ma,
    PV >=31, PV =<40,    PPV = s,
    PSA >=41, PSA =<50,  PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 64, #93
    Age >=41, Age =<60,  PAge = ma,
    PV >=41, PV =<80,    PPV = me,
    PSA >=31, PSA =<40,  PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 65, #94
    Age >=41, Age =<60,  PAge = ma,
    PV >=41, PV =<80,    PPV = me,
    PSA >=41, PSA =<50,  PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 68, #95
    Age >=41, Age =<60,  PAge = ma,
    PV >=81, PV =<100,   PPV = la,
    PSA >=21, PSA =<30,  PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 69, #96
    Age >=41, Age =<60,  PAge = ma,
    PV >=81, PV =<100,   PPV = la,
    PSA >=31, PSA =<40,  PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 73, #97
    Age >=41, Age =<60,  PAge = ma,
    PV >=101, PV =<120,  PPV = vla,
    PSA >=21, PSA =<30,  PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 79, #98
    Age >=61, Age =<80,  PAge = o,
    PV >=20, PV =<30,    PPV = vs,
    PSA >=31, PSA =<40,  PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 80, #99
    Age >=61, Age =<80,  PAge = o,
    PV >=20, PV =<30,    PPV = vs,
    PSA >=41, PSA =<50,  PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 84, #100
    Age >=61, Age =<80,  PAge = o,
    PV >=31, PV =<40,    PPV = s,
    PSA >=31, PSA =<40,  PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 89, #101
    Age >=61, Age =<80,  PAge = o,
    PV >=41, PV =<80,    PPV = me,
    PSA >=31, PSA =<40,  PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 93, #102
    Age >=61, Age =<80,  PAge = o,
    PV >=81, PV =<100,   PPV = la,
    PSA >=21, PSA =<30,  PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 94, #103
    Age >=61, Age =<80,  PAge = o,
    PV >=81, PV =<100,   PPV = la,
    PSA >=31, PSA =<40,  PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 98, #104
    Age >=61, Age =<80,  PAge = o,
    PV >=101, PV =<120,  PPV = vla,
    PSA >=21, PSA =<30,  PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 105, #105
    Age >=81, Age =<100, PAge = vo,
    PV >=20, PV =<30,    PPV = vs,
    PSA >=41, PSA =<50,  PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 109, #106
    Age >=81, Age =<100, PAge = vo,
    PV >=31, PV =<40,    PPV = s,
    PSA >=31, PSA =<40,  PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 113, #107
    Age >=81, Age =<100, PAge = vo,
    PV >=41, PV =<80,    PPV = me,
    PSA >=21, PSA =<30,  PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 118, #108
    Age >=81, Age =<100, PAge = vo,
    PV >=81, PV =<100,   PPV = la,
    PSA >=21, PSA =<30,  PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 122, #109
    Age >=81, Age =<100, PAge = vo,
    PV >=101, PV =<120,  PPV = vla,
    PSA >=11, PSA =<20,  PPSA = lo,
    risk_level(PAge,PPV,PPSA),
    end_system;
%---------------------------------------------------%

%---------------------------------------------------%
    % VERY HIGH RISK LEVEL
    % Rule 70, #110
    Age >=41, Age =<60,   PAge = ma,
    PV >=81, PV =<100,    PPV = la,
    PSA >=41, PSA =<50,   PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 74, #111
    Age >=41, Age =<60,   PAge = ma,
    PV >=101, PV =<120,   PPV = vla,
    PSA >=31, PSA =<40,   PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 75, #112
    Age >=41, Age =<60,    PAge = ma,
    PV >=101, PV =<120,    PPV = vla,
    PSA >=41, PSA =<50,    PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 85, #113
    Age >=61, Age =<80,    PAge = o,
    PV >=31, PV =<40,      PPV = s,
    PSA >=41, PSA =<50,    PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 90, #114
    Age >=61, Age =<80,    PAge = o,
    PV >=41, PV =<80,      PPV = me,
    PSA >=41, PSA =<50,    PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 95, #115
    Age >=61, Age =<80,    PAge = o,
    PV >=81, PV =<100,     PPV = la,
    PSA >=41, PSA =<50,    PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 99, #116
    Age >=61, Age =<80,    PAge = o,
    PV >=101, PV =<120,    PPV = vla,
    PSA >=31, PSA =<40,    PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 100, #117
    Age >=61, Age =<80,    PAge = o,
    PV >=101, PV =<120,    PPV = vla,
    PSA >=41, PSA =<50,    PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 110, #118
    Age >=81, Age =<100,   PAge = vo,
    PV >=31, PV =<40,      PPV = s,
    PSA >=41, PSA =<50,    PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 114, #119
    Age >=81, Age =<100,   PAge = vo,
    PV >=41, PV =<80,      PPV = me,
    PSA >=31, PSA =<40,    PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 115, #120
    Age >=81, Age =<100,   PAge = vo,
    PV >=41, PV =<80,      PPV = me,
    PSA >=41, PSA =<50,    PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

   % Rule 119, #121
    Age >=81, Age =<100,   PAge = vo,
    PV >=81, PV =<100,     PPV = la,
    PSA >=31, PSA =<40,    PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 120, #122
    Age >=81, Age =<100,   PAge = vo,
    PV >=81, PV =<100,     PPV = la,
    PSA >=41, PSA =<50,    PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 123, #123
    Age >=81, Age =<100,   PAge = vo,
    PV >=101, PV =<120,    PPV = vla,
    PSA >=21, PSA =<30,    PPSA = mi,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 124, #124
    Age >=81, Age =<100,   PAge = vo,
    PV >=101, PV =<120,    PPV = vla,
    PSA >=31, PSA =<40,    PPSA = h,
    risk_level(PAge,PPV,PPSA),
    end_system;

    % Rule 125, #125
    Age >=81, Age =<100,   PAge = vo,
    PV >=101, PV =<120,    PPV = vla,
    PSA >=41, PSA =<50,    PPSA = vh,
    risk_level(PAge,PPV,PPSA),
    end_system.
%---------------------------------------------------%





risk_level(Age,PV, PSA):-
%---------------------------------------------------%
    % VERY LOW RISK LEVEL
    % Rule 1, #1
    Age = vy, PV = vs, PSA = vlo,
    very_low_risk;
    % Rule 2, #2
    Age = vy, PV = vs,  PSA = lo,
    very_low_risk;
    % Rule 6, #3
    Age = vy, PV = s, PSA = vlo,
    very_low_risk;
    % Rule 7, #4
    Age = vy,  PV = s, PSA = lo,
    very_low_risk;
    % Rule 11, #5
    Age = vy,  PV = me,  PSA = vlo,
    very_low_risk;
    % Rule 12, #6
    Age = vy, PV = me, PSA = lo,
    very_low_risk;
    % Rule 21, #7
    Age = vy, PV = vla,  PSA = vlo,
    very_low_risk;
    % Rule 26, #8
    Age = y, PV = vs, PSA = vlo,
    very_low_risk;
    % Rule 27, #9
    Age = y,  PV = vs, PSA = lo,
    very_low_risk;
    % Rule 31, #10
    Age = y, PV = s, PSA = vlo,
    very_low_risk;
    % Rule 32, #11
    Age = y, PV = s, PSA = lo,
    very_low_risk;
    % Rule 36, #12
    Age = y, PV = me, PSA = vlo,
    very_low_risk;
    % Rule 41, #13
    Age = y, PV = la, PSA = vlo,
    very_low_risk;
    % Rule 46, #14
    Age = y, PV = vla, PSA = vlo,
    very_low_risk;
    % Rule 51, #15
    Age = ma, PV = vs, PSA = vlo,
    very_low_risk;
    % Rule 56, #16
    Age = ma, PV = s, PSA = vlo,
    very_low_risk;
    % Rule 61, #17
    Age = ma, PV = me,PSA = vlo,
    very_low_risk;
    % Rule 76, #18
    Age = o, PV = vs, PSA = vlo,
    very_low_risk;
%---------------------------------------------------%

%---------------------------------------------------%
    % LOW RISK LEVEL
    % Rule 3, #19
    Age = vy, PV = vs, PSA = mi,
    low_risk;
    % Rule 8, #20
    Age = vy, PV = s, PSA = mi,
    low_risk;
    % Rule 13, #21
    Age = vy,  PV = me, PSA = mi,
    low_risk;
    % Rule 16, #22
    Age = vy,  PV = la, PSA = vlo,
    low_risk;
    % Rule 17, #23
    Age = vy, PV = la, PSA = lo,
    low_risk;
    % Rule 22, #24
    Age = vy, PV = vla, PSA = lo,
    low_risk;
    % Rule 28, #25
    Age = y,  PV = vs, PSA = mi,
    low_risk;
    % Rule 33, #26
    Age = y, PV = s,PSA = mi,
    low_risk;
    % Rule 37, #27
    Age = y,  PV = me, PSA = lo,
    low_risk;
    % Rule 42, #28
    Age = y,  PV = la, PSA = lo,
    low_risk;
    % Rule 47, #29
    Age = y, PV = vla, PSA = lo,
    low_risk;
    % Rule 52, #30
    Age = ma, PV = vs, PSA = lo,
    low_risk;
    % Rule 53, #31
    Age = ma, PV = vs, PSA = mi,
    low_risk;
    % Rule 57, #32
    Age = ma, PV = s, PSA = lo,
    low_risk;
    % Rule 62, #33
    Age = ma,  PV = me, PSA = lo,
    low_risk;
    % Rule 66, #34
    Age = ma,  PV = la, PSA = vlo,
    low_risk;
    % Rule 71, #35
    Age = ma, PV = vla,PSA = vlo,
    low_risk;
    % Rule 77, #36
    Age = o, PV = vs, PSA = lo,
    low_risk;
    % Rule 81, #37
    Age = o, PV = s,PSA = vlo,
    low_risk;
    % Rule 82, #38
    Age = o, PV = s, PSA = lo,
    low_risk;
    % Rule 86, #39
    Age = o, PV = me, PSA = vlo,
    low_risk;
    % Rule 87, #40
    Age = o, PV = me, PSA = lo,
    low_risk;
    % Rule 91, #41
    Age = o,  PV = vla, PSA = vlo,
    low_risk;
    % Rule 101, #42
    Age = vo, PV = vs,PSA = vlo,
    low_risk;
    % Rule 102, #43
    Age = vo,PV = vs,PSA = lo,
    low_risk;
    % Rule 106, #44
    Age = vo,PV = s,PSA = vlo,
    low_risk;
%---------------------------------------------------%

%---------------------------------------------------%
    % MEDIUM RISK LEVEL
    % Rule 4, #45
    Age = vy,    PV = vs,    PSA = h,
    medium_risk;
    % Rule 5, #46
    Age = vy,    PV = vs,    PSA = vh,
    medium_risk;
    % Rule 9, #47
    Age = vy,    PV = s,    PSA = h,
    medium_risk;
    % Rule 10, #48
    Age = vy,    PV = ss,    PSA = vh,
    medium_risk;
    % Rule 14, #49
    Age = vy,    PV = me,    PSA = h,
    medium_risk;
    % Rule 18, #50
    Age = vy,    PV = la,    PSA = mi,
    medium_risk;
    % Rule 19, #51
    Age = vy,    PV = la,    PSA = h,
    medium_risk;
    % Rule 23, #52
    Age = vy,    PV = vla,    PSA = mi,
    medium_risk;
    % Rule 29, #53
    Age = y,    PV = vs,    PSA = h,
    medium_risk;
    % Rule 34, #54
    Age = y,    PV = s,    PSA = h,
    medium_risk;
    % Rule 38, #55
    Age = y,    PV = me,    PSA = mi,
    medium_risk;
    % Rule 39, #56
    Age = y,    PV = me,    PSA = h,
    medium_risk;
    % Rule 43, #57
    Age = y,    PV = la,    PSA = mi,
    medium_risk;
    % Rule 44, #58
    Age = y,    PV = la,    PSA = h,
    medium_risk;
    % Rule 48, #59
    Age = y,    PV = vla,    PSA = mi,
    medium_risk;
   % Rule 49, #60
    Age = y,    PV = vla,    PSA = h,
    medium_risk;
    % Rule 54, #61
    Age = ma,    PV = vs,    PSA = h,
    medium_risk;
    % Rule 58, #62
    Age = ma,    PV = s,    PSA = mi,
    medium_risk;
    % Rule 63, #63
    Age = ma,   PV = me,    PSA = mi,
    medium_risk;
    % Rule 67, #64
    Age = ma,    PV = la,    PSA = lo,
    medium_risk;
    % Rule 72, #65
    Age = ma,    PV = vla,    PSA = lo,
    medium_risk;
    % Rule 78, #66
    Age = o,    PV = vs,    PSA = mi,
    medium_risk;
    % Rule 83, #67
    Age = o,    PV = s,    PSA = mi,
    medium_risk;
    % Rule 88, #68
    Age = o,    PV = me,    PSA = mi,
    medium_risk;
    % Rule 92, #69
    Age = o,    PV = la,    PSA = lo,
    medium_risk;
    % Rule 96, #70
    Age = o,    PV = vla,    PSA = vlo,
    medium_risk;
    % Rule 97, #71
    Age = o,    PV = vla,    PSA = lo,
    medium_risk;
    % Rule 103, #72
    Age = vo,   PV = vs,    PSA = mi,
    medium_risk;
    % Rule 104, #73
    Age = vo,   PV = vs,    PSA = h,
     medium_risk;
    % Rule 107, #74
    Age = vo,   PV = s,    PSA = lo,
    medium_risk;
    % Rule 108, #75
    Age = vo,   PV = s,    PSA = mi,
    medium_risk;
    % Rule 111, #76
    Age = vo,   PV = me,    PSA = vlo,
    medium_risk;
    % Rule 112, #77
    Age = vo,   PV = me,    PSA = lo,
    medium_risk;
    % Rule 116, #78
    Age = vo,   PV = la,    PSA = vlo,
    medium_risk;
    % Rule 117, #79
    Age = vo,   PV = la,    PSA = lo,
    medium_risk;
    % Rule 121, #80
    Age = vo,   PV = la,    PSA = vlo,
    medium_risk;
%---------------------------------------------------%


%---------------------------------------------------%
    % HIGH RISK LEVEL
    % Rule 15, #81
    Age = vy,  PV = me,  PSA = vh,
    high_risk;
    % Rule 20, #82
    Age = vy,  PV = la,  PSA = vh,
    high_risk;
    % Rule 24, #83
    Age = vy,  PV = vla, PSA = h,
    high_risk;
    % Rule 25, #84
    Age = vy,  PV = vla, PSA = vh,
    high_risk;
    % Rule 30, #85
    Age = y,   PV = vs, PSA = vh,
    high_risk;
    % Rule 35, #86
    Age = y,   PV = s,  PSA = vh,
    high_risk;
    % Rule 40, #87
    Age = y, PV = me, PSA = vh,
    high_risk;
    % Rule 45, #88
    Age = y, PV = la, PSA = vh,
    high_risk;
    % Rule 50, #89
    Age = y, PV = vla, PSA = vh,
    high_risk;
    % Rule 55, #90
    Age = ma, PV = vs,PSA = vh,
    high_risk;
    % Rule 59, #91
    Age = ma, PV = s, PSA = h,
    high_risk;
    % Rule 60, #92
    Age = ma, PV = s, PSA = vh,
    high_risk;
    % Rule 64, #93
    Age = ma, PV = me, PSA = h,
    high_risk;
    % Rule 65, #94
    Age = ma, PV = me, PSA = vh,
    high_risk;
    % Rule 68, #95
    Age = ma, PV = la,PSA = mi,
    high_risk;
    % Rule 69, #96
    Age = ma, PV = la,PSA = h,
    high_risk;
    % Rule 73, #97
    Age = ma, PV = vla, PSA = mi,
    high_risk;
    % Rule 79, #98
    Age = o, PV = vs, PSA = h,
    high_risk;
    % Rule 80, #99
    Age = o, PV = vs, PSA = vh,
    high_risk;
    % Rule 84, #100
    Age = o, PV = s, PSA = h,
    high_risk;
    % Rule 89, #101
    Age = o, PV = me, PSA = h,
    high_risk;
    % Rule 93, #102
    Age = o, PV = la, PSA = mi,
    high_risk;
    % Rule 94, #103
    Age = o,   PV = la, PSA = h,
    high_risk;
    % Rule 98, #104
    Age = o,   PV = vla, PSA = mi,
    high_risk;
    % Rule 105, #105
    Age = vo,  PV = vs, PSA = vh,
    high_risk;
    % Rule 109, #106
    Age = vo,  PV = s, PSA = h,
    high_risk;
    % Rule 113, #107
    Age = vo, PV = me,PSA = mi,
    high_risk;
    % Rule 118, #108
    Age = vo, PV = la,  PSA = mi,
    high_risk;
    % Rule 122, #109
    Age = vo, PV = vla, PSA = lo,
    high_risk;
%---------------------------------------------------%


%---------------------------------------------------%
    % VERY HIGH RISK LEVEL
    % Rule 70, #110
    Age = ma, PV = la, PSA = vh,
    very_high_risk;
    % Rule 74, #111
    Age = ma, PV = vla, PSA = h,
    very_high_risk;
    % Rule 75, #112
    Age = ma, PV = vla, PSA = vh,
    very_high_risk;
    % Rule 85, #113
    Age = o,PV = s, PSA = vh,
    very_high_risk;
    % Rule 90, #114
    Age = o, PV = me,PSA = vh,
    very_high_risk;
    % Rule 95, #115
    Age = o, PV = la, PSA = vh,
    very_high_risk;
    % Rule 99, #116
    Age = o, PV  = vla, PSA = h,
    very_high_risk;
    % Rule 100, #117
    Age = o, PV = vla, PSA = vh,
    very_high_risk;
    % Rule 110, #118
    Age = vo, PV = s,PSA = vh,
    very_high_risk;
    % Rule 114, #119
    Age = vo,PV = me, PSA = h,
    very_high_risk;
    % Rule 115, #120
    Age = vo,PV = me,PSA = vh,
    very_high_risk;
    % Rule 119, #121
    Age = vo, PV = la, PSA = h,
    very_high_risk;
    % Rule 120, #122
    Age = vo,  PV = la,  PSA = vh,
    very_high_risk;
    % Rule 123, #123
    Age = vo,PV = vla, PSA = mi,
    very_high_risk;
    % Rule 124, #124
    Age = vo, PV = vla, PSA = h,
    very_high_risk;
    % Rule 125, #125
    Age = vo, PV = vla, PSA = vh,
    very_high_risk.
%---------------------------------------------------%





very_low_risk:-
    nl,
    write('Your Diagnose:'),nl,nl,
    write('*************************************************************'),nl,
    writeln('Prostate Cancer Risk Level:   -->> VERY LOW RISK LEVEL <<--'),
    write('*************************************************************'),nl,nl.


low_risk:-
    nl,
    write('Your Diagnose:'),nl,nl,
    write('********************************************************'),nl,
    writeln('Prostate Cancer Risk Level:   -->> LOW RISK LEVEL <<--'),
    write('********************************************************'),nl,nl.

medium_risk:-
    nl,
    write('Your Diagnose:'),nl,nl,
    write('***********************************************************'),nl,
    writeln('Prostate Cancer Risk Level:   -->> MEDIUM RISK LEVEL <<--'),
    write('***********************************************************'),nl,nl.

high_risk:-
    nl,
    write('Your Diagnose:'),nl,nl,
    write('*********************************************************'),nl,
    writeln('Prostate Cancer Risk Level:   -->> HIGH RISK LEVEL <<--'),
    write('*********************************************************'),nl,nl.

very_high_risk:-
    nl,
    write('Your Diagnose:'),nl,nl,
    write('**************************************************************'),nl,
    writeln('Prostate Cancer Risk Level:   -->> VERY HIGH RISK LEVEL <<--'),
    write('**************************************************************'),nl,nl.

end_system:-
    write('>> END OF DIAGNOSIS! <<').
