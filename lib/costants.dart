import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const Color kPrimaryColor=Color(0xff100B20);

const Color kSecondColor=Color(0xffef8262);

const Duration kPrimaryDuration=Duration(milliseconds: 300);

const kGtSectraFine='GT Sectra Fine';

const String errImage='https://mycomputerworks.com/wp-content/uploads/2017/05/joomla-404-error-page.png';


CollectionReference favoriteList = firestoreInstance.collection('favoriteList');
var firestoreInstance=FirebaseFirestore.instance;

CollectionReference user= FirebaseFirestore.instance.collection('user');
FirebaseAuth auth= FirebaseAuth.instance;
