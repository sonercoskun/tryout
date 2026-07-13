create table ENG.KMP_KAMPANYATEKLIFDETAY
(
    id                         NUMBER(19) not null,

    projeid                    NUMBER(19),

    hucreid                    NUMBER(19),

    hucrekodu                  VARCHAR2(64),

    islemkodu                  VARCHAR2(64) not null,

    kampanyaadi                VARCHAR2(64) not null,

    kampanyakodu               VARCHAR2(32) not null,

    kampanyabaslangictarihi    DATE,

    kampanyabitistarihi        DATE,

    dokumantaramasi            VARCHAR2(64),

    teklifadi                  VARCHAR2(390),

    teklifdetayi               VARCHAR2(1024),

    urunkodu                   NUMBER(19),

    alturunkodu                VARCHAR2(38),

    teklifaciklamasi           VARCHAR2(2000),

    teklifkodu                 VARCHAR2(64),

    teklifetkitarihi           DATE,

    teklifbitistarihi          DATE,

    kampanyaonceligi           NUMBER(3),

    hedefdisikitle             VARCHAR2(20),

    yonlenecekekran            VARCHAR2(100),

    kanalkodu                  VARCHAR2(3),

    kanalgorseli               VARCHAR2(1024),

    teklifhtml                 VARCHAR2(2000),

    katilimkosulu              VARCHAR2(693),

    kampanyasablonu            VARCHAR2(30),

    kampanyabirimi             VARCHAR2(200),

    karttipi                   NUMBER(2),

    menu                       VARCHAR2(100),

    atmparametre               VARCHAR2(100),

    atmparametremetin          VARCHAR2(100),

    atmparametreiki            VARCHAR2(100),

    yanitmesaji                VARCHAR2(1024),

    sestercihi                 VARCHAR2(1024),

    teklifvideourl             VARCHAR2(1024),

    dinamikvideourl            VARCHAR2(1024),

    katilimkosulumetni         VARCHAR2(250),

    bildirimkategorisi         NUMBER(1),

    disayonleneceklink         VARCHAR2(1024),

    disayonlenecekmesaj        VARCHAR2(1024),

    disayonlenecekbuton        VARCHAR2(50),

    disayonlenecekbaslik       VARCHAR2(200),

    atmmetinsolpozisyon        NUMBER(10),

    atmmetinustpozisyon        NUMBER(10),

    atmyonlenecekmenu          VARCHAR2(50),

    pushmobiluygulamakodu      NUMBER(2),

    giristarihi                DATE,

    tavsiyeedilebilirdurumkodu NUMBER(1),

    tamatmkanalgorseli         VARCHAR2(64),

    recorddate                 DATE,

    recordusercode             VARCHAR2(10),

    recordbranchcode           VARCHAR2(6),

    recordscreencode           VARCHAR2(10),

    recordrequestobjectid      VARCHAR2(36),

    recordchannelcode          NUMBER(2),

    pushsonrasisms             NUMBER(1)

);



    --ID için à kmp_seq_kampanyateklifdetay.nextval
CREATE SEQUENCE ENG.KMP_SEQ_KAMPANYATEKLIFDETAY START WITH 1 INCREMENT BY 1 NOCACHE;




create table ENG.KMP_KAMPANYATEKLIF

(

    kampanyareferansi            NUMBER(19) not null,

    kampanyaislemkodu            VARCHAR2(64),

    musterino                    VARCHAR2(12),

    kampanyamusteriid            NUMBER(19),

    tckimlikno                   VARCHAR2(11),

    vergino                      VARCHAR2(10),

    kampanyakodu                 VARCHAR2(32),

    kampanyaadi                  VARCHAR2(100),

    kampanyaaciklamasi           VARCHAR2(1024),

    kampanyakanalkodu            VARCHAR2(3),

    kampanyasablonu              VARCHAR2(30),

    kampanyaonceligi             NUMBER(2),

    kampanyabaslangictarihi      DATE,

    kampanyabitistarihi          DATE,

    teklifkodu                   VARCHAR2(64),

    teklifadi                    VARCHAR2(130),

    urunkodu                     NUMBER(10),

    teklifbaslangictarihi        DATE,

    teklifbitistarihi            DATE,

    kisamesajanahtarkelime       VARCHAR2(10),

    kisamesajmetni               VARCHAR2(918),

    ekrandagoruntulenmesuresi    NUMBER(2),

    gondereneposta               VARCHAR2(256),

    gonderenbaslik               VARCHAR2(100),

    epostakonusu                 VARCHAR2(256),

    acilirekranvar               VARCHAR2(10),

    musteriadi                   VARCHAR2(250),

    musterisoyadi                VARCHAR2(50),

    musterieposta                VARCHAR2(256),

    musteritelefonno             VARCHAR2(13),

    portfoysubekodu              VARCHAR2(6),

    portfoysubeadi               VARCHAR2(200),

    portfoysubeadresi            VARCHAR2(500),

    portfoysubetelefonno         VARCHAR2(20),

    portfoyyoneticikullanicikodu VARCHAR2(10),

    portfoyyoneticiadi           VARCHAR2(100),

    portfoyyoneticisoyadi        VARCHAR2(100),

    portfoyyoneticieposta        VARCHAR2(256),

    takimkodu                    VARCHAR2(9),

    kampanyadurumkodu            NUMBER(2),

    kampanyadurumguncellemetipi  NUMBER(2),

    teklifiliskino               NUMBER(2) default 0,

    giriskullanicikodu           VARCHAR2(10),

    giristarihi                  DATE default sysdate,

    guncelleyenkullanicikodu     VARCHAR2(10),

    guncellemetarihi             DATE,

    recorddate                   DATE,

    recordusercode               VARCHAR2(10),

    recordbranchcode             VARCHAR2(6),

    recordscreencode             VARCHAR2(10),

    recordrequestobjectid        VARCHAR2(36),

    recordchannelcode            NUMBER(2),

    hucrekodu                    VARCHAR2(64),

    teklifaciklamasi             VARCHAR2(1024),

    kampanyabirimi               VARCHAR2(50),

    musteritipi                  NUMBER(1),

    parametre1                   VARCHAR2(100),

    parametre2                   VARCHAR2(100),

    parametre3                   VARCHAR2(100),

    parametre4                   VARCHAR2(100),

    parametre5                   VARCHAR2(100),

    takimid                      NUMBER(19),

    parametre6                   VARCHAR2(100),

    parametre7                   VARCHAR2(100),

    parametre8                   VARCHAR2(100),

    parametre9                   VARCHAR2(100),

    parametre10                  VARCHAR2(100),

    parametre11                  VARCHAR2(100),

    parametre12                  VARCHAR2(100),

    parametre13                  VARCHAR2(100),

    parametre14                  VARCHAR2(100),

    parametre15                  VARCHAR2(100),

    parametresayi                NUMBER(19),

    ekrankodu                    VARCHAR2(100),

    baslik                       VARCHAR2(1024),

    teklifturu                   VARCHAR2(10),

    katilimkosulumu              VARCHAR2(10),

    bildirimmesaji               VARCHAR2(512),

    kampanyagosterimdurumu       VARCHAR2(10),

    kampanyanumarasi             VARCHAR2(20),

    bildirimturu                 VARCHAR2(30),

    yonlendirmelinki             VARCHAR2(256),

    kampanyakategorisi           NUMBER(1),

    skor                         NUMBER(3,2),

    notryanitsayisi              NUMBER(2),

    olumluolumsuzyanitsayisi     NUMBER(2),

    runid                        NUMBER(19),

    anketkodu                    VARCHAR2(12),

    cmmusteribilgimetni          VARCHAR2(2000),

    diltercihi                   VARCHAR2(10),

    kaynakuygulamatipi           NUMBER(1)

);



    --KAMPANYAREFERANSI  à KMP_SEQ_KAMPANYATEKLIF.nextval
CREATE SEQUENCE ENG.KMP_SEQ_KAMPANYATEKLIF START WITH 1 INCREMENT BY 1 NOCACHE;


create table ENG.KMP_KAMPANYASMSSIRALAMA

(

    id                    NUMBER(19) not null,

    kampanyaislemkodu     VARCHAR2(64),

    kampanyakodu          VARCHAR2(32),

    kampanyaadi           VARCHAR2(100),

    teklifkodu            VARCHAR2(64),

    hucrekodu             VARCHAR2(64),

    calismatarihi         DATE,

    gonderilecekadet      NUMBER(10),

    teklifbitistarihi     DATE,

    oncelik               NUMBER(3),

    kampanyabirimi        VARCHAR2(50),

    recorddate            DATE,

    recordusercode        VARCHAR2(10),

    recordbranchcode      VARCHAR2(6),

    recordscreencode      VARCHAR2(10),

    recordrequestobjectid VARCHAR2(36),

    recordchannelcode     NUMBER(2),

    kampanyakategorisi    NUMBER(1),

    gonderimdurumu        NUMBER(2),

    smsmetni              VARCHAR2(1028),

    aktiflik              NUMBER(1),

    durum                 NUMBER(1),

    baslangicsaati        VARCHAR2(5),

    bitissaati            VARCHAR2(5),

    tamamlanmadurumu      NUMBER(1),

    smstipi               VARCHAR2(5),

    kaynakuygulamatipi    NUMBER(1)

);



    --ID  à  KMP_SEQ_KAMPANYASMSSIRALAMA.nextval
CREATE SEQUENCE ENG.KMP_SEQ_KAMPANYASMSSIRALAMA START WITH 1 INCREMENT BY 1 NOCACHE;


CREATE TABLE ENG.KMP_KAMPANYADOSYA

(

    ID                     NUMBER(19) NOT NULL,

    TOPLUISLEM             VARCHAR2(3),

    ILETISIMKODU           VARCHAR2(64),

    SENARYOADI             VARCHAR2(100),

    SONKAYITTARIHI         DATE,

    SONKAYITID             NUMBER(19),

    RECORDDATE             DATE,

    RECORDUSERCODE         VARCHAR2(10),

    RECORDBRANCHCODE       VARCHAR2(6),

    RECORDSCREENCODE       VARCHAR2(10),

    RECORDREQUESTOBJECTID  VARCHAR2(36),

    RECORDCHANNELCODE      NUMBER(2)

);

CREATE SEQUENCE ENG.KMP_SEQ_KAMPANYADOSYA START WITH 1 INCREMENT BY 1 NOCACHE;

create table ENG.KMP_KAMPANYAKANALYANIT
(
    ID                      NUMBER,
    KAMPANYAKODU            VARCHAR2(255),
    KAMPANYAADI             VARCHAR2(255),
    KANALKODU               VARCHAR2(255),
    ATMBUTONKONUMID         VARCHAR2(255),
    ATMBUTONKONUMACIKLAMASI VARCHAR2(255),
    RECORDDATE              DATE,
    RECORDUSERCODE          VARCHAR2(255),
    RECORDBRANCHCODE        VARCHAR2(255),
    RECORDSCREENCODE        VARCHAR2(255),
    RECORDREQUESTOBJECTID   VARCHAR2(255),
    RECORDCHANNELCODE       VARCHAR2(255),
    KAMPANYAISLEMKODU       VARCHAR2(255),
    KANALYANITTANIMID       VARCHAR2(255)
);

CREATE SEQUENCE ENG.KMP_SEQ_KAMPANYAKANALYANIT START WITH 1 INCREMENT BY 1 NOCACHE;

create table ENG.KMP_UNICAKAMPANYABILGILERI
(
    ID                    NUMBER,
    KAMPANYAKODU          VARCHAR2(255),
    KAMPANYAADI           VARCHAR2(255),
    KAMPANYAACIKLAMASI    VARCHAR2(255),
    STATU                 NUMBER,
    RECORDDATE            DATE,
    RECORDUSERCODE        VARCHAR2(255),
    RECORDBRANCHCODE      VARCHAR2(255),
    RECORDSCREENCODE      VARCHAR2(255),
    RECORDCHANNELCODE     NUMBER,
    RECORDREQUESTOBJECTID VARCHAR2(255),
    MAILFLAG              NUMBER,
    KAMPANYAADIEN         VARCHAR2(255)
);

CREATE SEQUENCE ENG.kmp_seq_unicakampanya START WITH 1 INCREMENT BY 1 NOCACHE;

create table ENG.KMP_ATMTEKLIFGIRISTANIM
(
    ID                NUMBER,
    KAMPANYAISLEMKODU VARCHAR2(255),
    TEKLIFKODU        VARCHAR2(255),
    GIRISSIRASI       NUMBER,
    GIRISTIPI         NUMBER,
    RECORDDATE        TIMESTAMP(6),
    RECORDUSERCODE    VARCHAR2(255)
);

CREATE SEQUENCE ENG.kmp_seq_atmteklifgiristanim START WITH 1 INCREMENT BY 1 NOCACHE;
