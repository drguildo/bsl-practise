package com.drguildo.bsl;

import java.util.Random;

public class BslLetter {
  private Character letter;

  public BslLetter(String letter) {
    this((char) letter.charAt(0));
  }

  public BslLetter(char c) {
    c = Character.toUpperCase(c);

    if (c < 'A' || c > 'Z')
      throw new IllegalArgumentException("");

    letter = new Character(Character.toUpperCase(c));
  }

  public BslLetter() {
    this((char) ('A' + new Random().nextInt(26)));
  }

  public Character getLetter() {
    return letter;
  }

  public static boolean checkParameter(String p) {
    if (p == null)
      return false;

    if (p.length() != 1)
      return false;

    return true;
  }

  public boolean equals(BslLetter other) {
    return letter.compareTo(other.letter) == 0;
  }

  public String getFilename() {
    return "bsl-alphabet" + "/" + letter + ".png";
  }
}
