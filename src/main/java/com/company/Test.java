package com.company;

public class Test {

    public static void main(String[] args) {

        Balloon red = new Balloon("Red"); // memory reference = 50
//        System.out.println("red"+red.hashCode());
        Balloon blue = new Balloon("Blue"); // memory reference = 100
//        System.out.println("blue"+blue.hashCode());

        swap(red, blue);
//        System.out.println("After the swap method executes:");
//        System.out.println("`red` color value = " + red.getColor());
//        System.out.println("`blue` color value = " + blue.getColor());
        changeValue(blue);
//        System.out.println("After the changeValue method executes:");
//        System.out.println("`blue` color value = " + blue.getColor());
//        System.out.println(blue.hashCode());
        Balloon balloon = new Balloon();
        balloon.setColor("red");
        Deneme deneme = new Deneme();
        System.out.println(balloon.getColor()+balloon.hashCode());
        deneme.get(balloon);
        System.out.println(balloon.getColor()+balloon.hashCode());
    }

    // Generic swap method
    public static void swap(Object o1, Object o2){
//        System.out.println("o1"+o1.hashCode());
//        System.out.println("o2"+o2.hashCode());
        Object temp = o1;
        o1 = o2;
        o2 = temp;
//        System.out.println("aftero1"+o1.hashCode());
//        System.out.println("aftero2"+o2.hashCode());
    }

    private static void changeValue(Balloon balloon) { // balloon = 100
//        System.out.println("29"+balloon.hashCode());
        balloon.setColor("Red"); // balloon = 100
        balloon = new Balloon("Green"); // balloon = 200
//        System.out.println("afternew"+balloon.hashCode());
        balloon.setColor("Blue"); // balloon = 200
    }

}
