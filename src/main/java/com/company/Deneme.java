package com.company;

public class Deneme {
    public Deneme(){}
    public void get(Balloon balloon){
        System.out.println(balloon.getColor()+balloon.hashCode());
        balloon.setColor("mavi");
        System.out.println(balloon.getColor()+balloon.hashCode());
        balloon = new Balloon("siyah");
        System.out.println(balloon.getColor()+balloon.hashCode());
    }
}
