import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/data_budget.dart';
import 'package:counter_7/tambah_budget.dart';
import 'package:flutter/services.dart';

class User{
    final String judul;
    final int nominal;
    final String tipeBudget;

    User(this.judul, this.nominal, this. tipeBudget);
}

class UserList {
    static List<User> userList = [];
}