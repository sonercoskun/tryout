SELECT count(campaign_code), campaign_code from ptml_chn_sms_bc where campaign_code != 'PTTesting' group by campaign_code;

select * from ptml_chn_sms_bc where campaign_code = 'C000007612';

select count(*) from ptml_chn_sms_bc where last_change > '2024-06-28 00:00:00.000000';