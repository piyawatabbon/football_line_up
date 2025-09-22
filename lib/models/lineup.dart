/// ตัวอย่างข้อมูลจาก API (ตัดมาเฉพาะที่จำเป็น)
/// ปรกติให้คุณแปลง message.txt เป็นโครงสร้างเดียวกันนี้
class Player {
  final String name;
  final int formationPlace;

  Player({required this.name, required this.formationPlace});
}

class Lineup {
  final String teamName;
  final String formationUsed; // '442','433',...
  final List<Player> players; // แต่ละคนมี formationPlace = เลขตำแหน่งในรูป

  Lineup({
    required this.teamName,
    required this.formationUsed,
    required this.players,
  });
}
