class Month {
  final String number;
  final String name;

  Month(this.number, this.name);

  static List<Month> getMonth() {
    return [
      Month(
        '01',
        'Janeiro',
      ),
      Month(
        '02',
        'Fevereiro',
      ),
      Month(
        '03',
        'Março',
      ),
      Month(
        '04',
        'Abril',
      ),
      Month(
        '05',
        'Maio',
      ),
      Month(
        '06',
        'Junho',
      ),
      Month(
        '07',
        'Julho',
      ),
      Month(
        '08',
        'Agosto',
      ),
      Month(
        '09',
        'Setembro',
      ),
      Month(
        '10',
        'Outubro',
      ),
      Month(
        '11',
        'Novembro',
      ),
      Month(
        '12',
        'Dezembro',
      ),
    ];
  }
}
