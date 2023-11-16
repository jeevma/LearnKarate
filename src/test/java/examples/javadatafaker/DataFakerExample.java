package examples.javadatafaker;

import net.datafaker.Faker;

public class DataFakerExample {

    public static void main(String[] args) {
        Faker faker = new Faker();
        System.out.println(faker.address().city());
        System.out.println(faker.number().numberBetween(2, 8));
        System.out.println(faker.number().digits(8));
        System.out.println(faker.country().name());
    }
}
