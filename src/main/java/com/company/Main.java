package com.company;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.concurrent.atomic.AtomicLong;
import java.util.stream.Collectors;


import static com.google.common.base.Preconditions.checkNotNull;

public class Main {
    private static final AtomicLong average = new AtomicLong(0);
    private static final AtomicLong count = new AtomicLong(0);
    private static final DecimalFormat decimalFormat = new DecimalFormat("#.##");
    public static final String ZERO = "0";
    private static final String STATUS_FINISHED = "FINISHED";
    private static final String RUN_ID_LIST_PREFIX = "RunIdList=";
    private static final String testNumbers = "923032182278,923059126178,923074220020,923059126278,923059127278,923074220024,923074220018,923074220017,923074330014,923074220025,923074310024,923059127278";

    public static void main(String[] args) throws InterruptedException, ParseException {
//        LocalDate initial = LocalDate.now().with(firstDayOfMonth());
//        System.out.printf(initial.toString());
//
//        LocalDate date = LocalDate.now().with(firstDayOfMonth());
//        int calculatedDate = Integer.parseInt(
//                date.format(DateTimeFormatter.ofPattern("yyyyMMdd")));
//        System.out.println("\n" + calculatedDate);
//
//        String opencodeResp = "responsecode=0~message=";
//        try {
//            Map<String, String> stringStringMap = ImmutableMap.copyOf(Splitter.on('~')
//                    .withKeyValueSeparator("=")
//                    .split(checkNotNull(opencodeResp)));
//            System.out.printf("Map" + stringStringMap.toString() + "\n");
//
//            if (stringStringMap.containsKey("responsecode") && stringStringMap.containsKey("message")
//                    && stringStringMap.values().stream().allMatch(Objects::nonNull)) {
//                if (stringStringMap.get("responsecode").equals("0")) {
//                        String strcode = stringStringMap.get("responsecode");
//                        System.out.printf(strcode);
//                        String strmsg = stringStringMap.get("message");
//                        System.out.printf(strmsg);
//                } else if (!stringStringMap.get("responsecode").equals("0")) {
//                        String str5 = stringStringMap.get("responsecode");
//                        System.out.printf("\nstr5:" + str5);
//                        String str6 = stringStringMap.get("message");
//                        System.out.printf("\nstr6:" + str6);
//                } else {
//                    System.out.printf("\n" + opencodeResp);
//                }
//            }
//        } catch (IllegalArgumentException illegalArgumentException) {
//            System.out.printf(illegalArgumentException.getMessage()+"\n");
//            throw illegalArgumentException;
//        } catch (Exception exception) {
//            System.out.printf(exception.getMessage()+"\n");
//            throw exception;
//        }
//
//        Instant RequestStartTime = Instant.now();
//        System.out.printf(RequestStartTime.toString() + "\n");
//
//        Thread.sleep(3000);
//        Instant RequestEndTime = Instant.now();
//        System.out.printf(RequestEndTime.toString() + "\n");
//
//        Duration TotalTime = Duration.between(RequestStartTime, RequestEndTime);
//        System.out.printf("\nCompleted in " + TotalTime.getSeconds() + " seconds\n");
//        System.out.printf("Completed in " + TotalTime.toMillis() + " milliseconds");

//        LocalDateTime now = LocalDateTime.now();
//        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss,SSSSSSSSS");
//        System.out.println(dateTimeFormatter.format(now));
//        String timestamp = dateTimeFormatter.format(now);
//        System.out.println(timestamp);
//        String str = dateFormat.format(System.currentTimeMillis());
//        System.out.println(str);
//        Instant RequestStartTime = Instant.now();
//        Thread.sleep(1000);
//        Instant RequestEndTime = Instant.now();
//        Duration duration = Duration.between(RequestStartTime,RequestEndTime);
//        System.out.println(duration.toMillis());
//        count.addAndGet(5);
//        System.out.println(count);
//        average.addAndGet(5);
//        average.addAndGet(7);
//        average.addAndGet(9);
//        average.addAndGet(5);
//        average.addAndGet(6);
//        System.out.println(average);
//        long countl = count.getAndSet(0);
//        long averagel = average.getAndSet(0);
////        System.out.println(decimalFormat.format(averagel / countl));
//        LocalDate localDate = LocalDate.now();
//        DateTimeFormatter dateTimeFormatter =
//        LocalDateTime endOfDay = localDate.atTime(LocalTime.MAX);
//        java.time.format.DateTimeFormatter dateTimeFormatter = java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss,SSSSSSSSS");
//        String startDate = LocalDateTime.now().format(dateTimeFormatter);
//        Timestamp timestamp = Timestamp.valueOf(startDate);
//        System.out.println(timestamp);
//        ZonedDateTime zonedDateTime = ZonedDateTime.now();
//        zonedDateTime = zonedDateTime.withHour(23).withMinute(59).withSecond(59).truncatedTo(ChronoUnit.SECONDS);
//        System.out.println(zonedDateTime);

//        String response = "responsemessage=Internal Server Error[Error Calling UpdateOffer Ucip Flow ResponseCode = 104&message";
//        String message = response.split("ResponseCode =")[0].split("responsemessage=")[1];
//        String code = response.split("ResponseCode =")[1].split("&")[0].trim();
//        System.out.println(message);
//        System.out.println(code);
//        LocalDate localDate = LocalDate.now();
//        Date date = Date.valueOf(localDate);
//        System.out.println(date);

//        String endDate = "DATE";
//        LocalDateTime endOfDay = LocalDateTime.now();
//
//        if (endDate.startsWith("DATE")) {
//            try {
//                if (endDate.contains("+") && !endDate.split("\\+")[0].isEmpty()) {
//                    endOfDay = endOfDay.plusDays(Long.parseLong(endDate.split("\\+")[1]));
//                }
//                endOfDay = endOfDay.withHour(23).withMinute(59).withSecond(59);
//                System.out.println(endOfDay);
//            } catch (Exception e) {
//                throw e;
//            }
//        }
//
//        String yüz = "5";
//        String str = String.valueOf(Long.parseLong(yüz)*60);
//        System.out.println(str);
//        String value = "100";
//        String dataValue = String.valueOf(Long.parseLong(value)*1048576);
//        System.out.println(dataValue);

//        JSONObject jsonObject = new JSONObject();
//        Collection<String> dates = new ArrayList<>();
//        dates.add("2022");
//        dates.add("2023");
//        jsonObject.put("PRESENT_FLAG", dates);
//        System.out.println(jsonObject.toString());

//        String  query = "select STATUS, SEGMENT_NAME from %tableName where ID in (?)";
//        List<String> list = new ArrayList<>();
//        list.add("adf");
//        list.add("aafs");
//        list.add("fdjf");
//        list.add("fnu");
//        String runDesc = "adf, aafs, fdjf, fnu";
//        String str = query.replace("?",list.toString().substring(1,list.toString().length()-1));
//        System.out.println(str);

//        String date = "2022-06-28 13:21:05.044";
//        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//        List<String> strings = Arrays.asList(date.split("\\."));
//        System.out.println(strings.get(0));
//        LocalDateTime localDateTime = LocalDateTime.parse((Arrays.asList(date.split("\\."))).get(0),dateTimeFormatter);
//        System.out.println(localDateTime);
//        String lastMonth = "20210701";
//        String newMonth = "20220701";
//        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMMdd");
//        LocalDate localDateLastMonth = LocalDate.parse(lastMonth,dateTimeFormatter);
//        LocalDate localDateNewMonth = LocalDate.parse(newMonth,dateTimeFormatter);
//        LocalDate date = LocalDate.now();
//
//        if(!(date.getYear() == localDateLastMonth.getYear()) && !date.getMonth().equals(localDateLastMonth.getMonth())){
//            System.out.println("sıfırla1");
//        }if(localDateLastMonth.getMonth().equals(date.getMonth())){
//            System.out.println("sıfırla2");
//        }

//
//        LocalDateTime localDateTime1 = LocalDateTime.now();
//        Duration duration = Duration.between(localDateTime, localDateTime1);
//        System.out.println(Math.abs(duration.toMinutes()));
//
//        String dataType = "soner";
//        String boş = "";
//        if(dataType != null && !dataType.isEmpty() && !ZERO.equals(dataType)) {
//            DataType dataTypeEnum = DataType.fromString(dataType);
//            if(!(dataTypeEnum == null)) {
//                switch (Objects.requireNonNull(dataTypeEnum)) {
//                    case TWO_G:
//                        boş = "3700";
//                        break;
//                    case FOUR_G:
//                        boş = "3318";
//                        break;
//                    case LATE_NIGHT:
//                        boş = "3319";
//                        break;
//                    case OFF_PEAK:
//                        boş = "3321";
//                        break;
//                }
//            }else{boş = ZERO;}
//        }else {boş = ZERO;}
//        System.out.println(boş);
//        boolean checkAllFinished = true;
//        List<String> resultCheckScenario = new ArrayList<>();
//        resultCheckScenario.add("FINISHED");
//        resultCheckScenario.add("ERROR");
//        for (String status : resultCheckScenario) {
//            if (!status.equals(STATUS_FINISHED)) {
//                checkAllFinished = false;
//                break;
//            }
//        }
//        if (checkAllFinished) {
//            System.out.println("finish");
//        } else {
//            System.out.println(checkAllFinished);
//        }
//        String runDescription = "RunIdList=476,477,478";
//        if(runDescription.startsWith(RUN_ID_LIST_PREFIX)){
//            runDescription = runDescription.split(RUN_ID_LIST_PREFIX)[1];
//        }
//        System.out.println(runDescription);
//
//        String msisdn = "0923325311937";
//        msisdn = msisdn.substring(3,12);
//        System.out.println("0" + msisdn);
//        int cnt = 0;
//        cnt++;
//        System.out.println(cnt);
//        java.sql.Date date = java.sql.Date.valueOf(java.time.LocalDate.now());
//        System.out.println(date);
//        List<Object[]> resultForExecution = new ArrayList<>();
//        String zero = "zero";
//        String four = "four";
//        String S = "S";
//        Object[] object1 = new Object[] {zero,four,S};
//        Object[] object2 = new Object[] {four,S,zero};
//        Object[] object3 = new Object[] {S,zero,four};
//        resultForExecution.add(object1);
//        resultForExecution.add(object2);
//        resultForExecution.add(object3);
//        ListIterator<Object[]> lit = resultForExecution.listIterator();
//        while(lit.hasNext()){
//            System.out.println(lit.next()[0]);
//            System.out.println(lit.next()[1]);
//            System.out.println(lit.next()[2]);
//            boolean next = lit.hasNext();
//            if(lit.hasNext()){
//                if("zero".equals(resultForExecution.get(lit.nextIndex())[1].toString())){
//                    System.out.println("I'm out");
//                    break;
//                }
//                System.out.println(lit.next()[1].toString());
//            }
//        }

//        for (int rownum = 0; rownum < resultForExecution.size(); rownum++) {
//            System.out.println(object1[0]);
//            System.out.println(object1[1]);
//            System.out.println(object1[2]);
//            if(resultForExecution.iterator().hasNext()) {
//                if ("S".equalsIgnoreCase(resultForExecution.get(rownum + 1)[3].toString())) {
//                    break;
//                }
//            }
//        }
//        List<Long> testNumbersList = Arrays.asList(testNumbers.split(",")).stream().map(s -> Long.parseLong(s.trim())).collect(Collectors.toList());
//        System.out.println(testNumbersList);
//        boolean silentMode = false;
//        int cnt = 0;
//        for(Long msisdn:testNumbersList){
//            if(msisdn == Long.valueOf("923059127278").longValue()){
//                cnt++;
//            }
//        }
//        if(!(cnt > 0)){
//            silentMode = true;
//        }
//        System.out.println(silentMode);
//
//        String str = "Phone band ya out of coverage honay ki waja say agar apki calls miss ho jati hain tou dial *180# or hasil karo Jazz Missed Call Alert @ Rs.1.82+ t rozana";

        byte[] byt =  new byte[] {12};
        System.out.println(byt[0]);
    }
}
