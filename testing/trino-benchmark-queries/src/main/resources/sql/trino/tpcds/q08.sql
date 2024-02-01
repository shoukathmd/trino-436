SELECT
  "s_store_name"
, "sum"("ss_net_profit")
FROM
  ${database}.${schema}.store_sales
, ${database}.${schema}.date_dim
, ${database}.${schema}.store
, (
   SELECT "ca_zip"
   FROM
     (
(
         SELECT "substr"("ca_zip", 1, 5) "ca_zip"
         FROM
           ${database}.${schema}.customer_address
         WHERE ("substr"("ca_zip", 1, 5) IN (
                '24128'
              , '57834'
              , '13354'
              , '15734'
              , '78668'
              , '76232'
              , '62878'
              , '45375'
              , '63435'
              , '22245'
              , '65084'
              , '49130'
              , '40558'
              , '25733'
              , '15798'
              , '87816'
              , '81096'
              , '56458'
              , '35474'
              , '27156'
              , '83926'
              , '18840'
              , '28286'
              , '24676'
              , '37930'
              , '77556'
              , '27700'
              , '45266'
              , '94627'
              , '62971'
              , '20548'
              , '23470'
              , '47305'
              , '53535'
              , '21337'
              , '26231'
              , '50412'
              , '69399'
              , '17879'
              , '51622'
              , '43848'
              , '21195'
              , '83921'
              , '15559'
              , '67853'
              , '15126'
              , '16021'
              , '26233'
              , '53268'
              , '10567'
              , '91137'
              , '76107'
              , '11101'
              , '59166'
              , '38415'
              , '61265'
              , '71954'
              , '15371'
              , '11928'
              , '15455'
              , '98294'
              , '68309'
              , '69913'
              , '59402'
              , '58263'
              , '25782'
              , '18119'
              , '35942'
              , '33282'
              , '42029'
              , '17920'
              , '98359'
              , '15882'
              , '45721'
              , '60279'
              , '18426'
              , '64544'
              , '25631'
              , '43933'
              , '37125'
              , '98235'
              , '10336'
              , '24610'
              , '68101'
              , '56240'
              , '40081'
              , '86379'
              , '44165'
              , '33515'
              , '88190'
              , '84093'
              , '27068'
              , '99076'
              , '36634'
              , '50308'
              , '28577'
              , '39736'
              , '33786'
              , '71286'
              , '26859'
              , '55565'
              , '98569'
              , '70738'
              , '19736'
              , '64457'
              , '17183'
              , '28915'
              , '26653'
              , '58058'
              , '89091'
              , '54601'
              , '24206'
              , '14328'
              , '55253'
              , '82136'
              , '67897'
              , '56529'
              , '72305'
              , '67473'
              , '62377'
              , '22752'
              , '57647'
              , '62496'
              , '41918'
              , '36233'
              , '86284'
              , '54917'
              , '22152'
              , '19515'
              , '63837'
              , '18376'
              , '42961'
              , '10144'
              , '36495'
              , '58078'
              , '38607'
              , '91110'
              , '64147'
              , '19430'
              , '17043'
              , '45200'
              , '63981'
              , '48425'
              , '22351'
              , '30010'
              , '21756'
              , '14922'
              , '14663'
              , '77191'
              , '60099'
              , '29741'
              , '36420'
              , '21076'
              , '91393'
              , '28810'
              , '96765'
              , '23006'
              , '18799'
              , '49156'
              , '98025'
              , '23932'
              , '67467'
              , '30450'
              , '50298'
              , '29178'
              , '89360'
              , '32754'
              , '63089'
              , '87501'
              , '87343'
              , '29839'
              , '30903'
              , '81019'
              , '18652'
              , '73273'
              , '25989'
              , '20260'
              , '68893'
              , '53179'
              , '30469'
              , '28898'
              , '31671'
              , '24996'
              , '18767'
              , '64034'
              , '91068'
              , '51798'
              , '51200'
              , '63193'
              , '39516'
              , '72550'
              , '72325'
              , '51211'
              , '23968'
              , '86057'
              , '10390'
              , '85816'
              , '45692'
              , '65164'
              , '21309'
              , '18845'
              , '68621'
              , '92712'
              , '68880'
              , '90257'
              , '47770'
              , '13955'
              , '70466'
              , '21286'
              , '67875'
              , '82636'
              , '36446'
              , '79994'
              , '72823'
              , '40162'
              , '41367'
              , '41766'
              , '22437'
              , '58470'
              , '11356'
              , '76638'
              , '68806'
              , '25280'
              , '67301'
              , '73650'
              , '86198'
              , '16725'
              , '38935'
              , '13394'
              , '61810'
              , '81312'
              , '15146'
              , '71791'
              , '31016'
              , '72013'
              , '37126'
              , '22744'
              , '73134'
              , '70372'
              , '30431'
              , '39192'
              , '35850'
              , '56571'
              , '67030'
              , '22461'
              , '88424'
              , '88086'
              , '14060'
              , '40604'
              , '19512'
              , '72175'
              , '51649'
              , '19505'
              , '24317'
              , '13375'
              , '81426'
              , '18270'
              , '72425'
              , '45748'
              , '55307'
              , '53672'
              , '52867'
              , '56575'
              , '39127'
              , '30625'
              , '10445'
              , '39972'
              , '74351'
              , '26065'
              , '83849'
              , '42666'
              , '96976'
              , '68786'
              , '77721'
              , '68908'
              , '66864'
              , '63792'
              , '51650'
              , '31029'
              , '26689'
              , '66708'
              , '11376'
              , '20004'
              , '31880'
              , '96451'
              , '41248'
              , '94898'
              , '18383'
              , '60576'
              , '38193'
              , '48583'
              , '13595'
              , '76614'
              , '24671'
              , '46820'
              , '82276'
              , '10516'
              , '11634'
              , '45549'
              , '88885'
              , '18842'
              , '90225'
              , '18906'
              , '13376'
              , '84935'
              , '78890'
              , '58943'
              , '15765'
              , '50016'
              , '69035'
              , '49448'
              , '39371'
              , '41368'
              , '33123'
              , '83144'
              , '14089'
              , '94945'
              , '73241'
              , '19769'
              , '47537'
              , '38122'
              , '28587'
              , '76698'
              , '22927'
              , '56616'
              , '34425'
              , '96576'
              , '78567'
              , '97789'
              , '94983'
              , '79077'
              , '57855'
              , '97189'
              , '46081'
              , '48033'
              , '19849'
              , '28488'
              , '28545'
              , '72151'
              , '69952'
              , '43285'
              , '26105'
              , '76231'
              , '15723'
              , '25486'
              , '39861'
              , '83933'
              , '75691'
              , '46136'
              , '61547'
              , '66162'
              , '25858'
              , '22246'
              , '51949'
              , '27385'
              , '77610'
              , '34322'
              , '51061'
              , '68100'
              , '61860'
              , '13695'
              , '44438'
              , '90578'
              , '96888'
              , '58048'
              , '99543'
              , '73171'
              , '56691'
              , '64528'
              , '56910'
              , '83444'
              , '30122'
              , '68014'
              , '14171'
              , '16807'
              , '83041'
              , '34102'
              , '51103'
              , '79777'
              , '17871'
              , '12305'
              , '22685'
              , '94167'
              , '28709'
              , '35258'
              , '57665'
              , '71256'
              , '57047'
              , '11489'
              , '31387'
              , '68341'
              , '78451'
              , '14867'
              , '25103'
              , '35458'
              , '25003'
              , '54364'
              , '73520'
              , '32213'
              , '35576'))
      )       INTERSECT (
         SELECT "ca_zip"
         FROM
           (
            SELECT
              "substr"("ca_zip", 1, 5) "ca_zip"
            , "count"(*) "cnt"
            FROM
              ${database}.${schema}.customer_address
            , ${database}.${schema}.customer
            WHERE ("ca_address_sk" = "c_current_addr_sk")
               AND ("c_preferred_cust_flag" = 'Y')
            GROUP BY "ca_zip"
            HAVING ("count"(*) > 10)
         )  a1
      )    )  a2
)  v1
WHERE ("ss_store_sk" = "s_store_sk")
   AND ("ss_sold_date_sk" = "d_date_sk")
   AND ("d_qoy" = 2)
   AND ("d_year" = 1998)
   AND ("substr"("s_zip", 1, 2) = "substr"("v1"."ca_zip", 1, 2))
GROUP BY "s_store_name"
ORDER BY "s_store_name" ASC
LIMIT 100