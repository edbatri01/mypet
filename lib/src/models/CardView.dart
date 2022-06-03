import 'package:flutter/material.dart';

class CardView {
  final String image, title, description;
  final int id;
  CardView({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
  });
}

List<CardView> cards = [
  CardView(
    id: 1,
    image: 'assets/images/bolfo.jpg',
    title: 'Bolfo',
    description: 'Shampoo',
  ),
  CardView(
    id: 2,
    image: 'assets/images/caniforte.jpg',
    title: 'Caniforte',
    description: 'Nutre a tu can',
  ),
  CardView(
    id: 3,
    image: 'assets/images/canitabs.jpg',
    title: 'Canitabs',
    description: 'Vitaminas caninas',
  ),
  CardView(
    id: 4,
    image: 'assets/images/dipramida.jpg',
    title: 'Dipramida',
    description: 'Antiemético',
  ),
  CardView(
    id: 5,
    image: 'assets/images/ivermectina.jpg',
    title: 'Ivermectina',
    description: 'Previene los parasitos',
  ),
  CardView(
    id: 6,
    image: 'assets/images/nexgard.jpg',
    title: 'Nexgard',
    description: 'Mata parasitos',
  ),
  CardView(
    id: 7,
    image: 'assets/images/novabismol.jpg',
    title: 'Novabismol',
    description: 'Para agruras',
  ),
  CardView(
    id: 8,
    image: 'assets/images/proventis.png',
    title: 'Proventis',
    description: ' Proviotico',
  ),
  CardView(
    id: 9,
    image: 'assets/images/sedagotas.jpg',
    title: 'Sedagotas',
    description: 'Tranquilizante',
  ),
];