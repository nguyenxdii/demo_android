import 'package:flutter/material.dart';

class Character {
  final String name;
  final String rarity;
  final String element;
  final String weapon;
  final String imageUrl;
  final String description;
  final Color color;

  Character({
    required this.name,
    required this.rarity,
    required this.element,
    required this.weapon,
    required this.imageUrl,
    required this.description,
    required this.color,
  });

  /*
    fusion:  const Color(0xFFC82A4B),
    glacio:  const Color(0xFF39B1D1),
    aero:    const Color(0xFF30C8A0),
    electro: const Color(0xFFA632B0),
    spectro: const Color(0xFFB8A81E),
    havoc:   const Color(0xFF981554),
  */

  // Dữ liệu mẫu
  static List<Character> getCharacters() {
    return [
      Character(
        name: 'Chisa',
        rarity: '5-Star',
        element: 'Havoc', // Hệ Havoc
        weapon: 'Sword', // Kiếm Đơn
        imageUrl: 'assets/images/chisa.jpg',
        description:
            'Chisa là một Resonator hệ Havoc có khả năng chiến đấu trong Wuthering Waves. '
            'Cô là một học sinh chu đáo và điềm tĩnh đến từ Học viện Startorch. '
            'Với Chisa, mọi thứ đều có thể được phân tích, lý giải và giải quyết — '
            'ngoại trừ những mối liên kết giữa con người. '
            'Sự gắn kết ấy có thể bị cắt đứt, nhưng chính sự mong manh đó lại khiến chúng trở nên quý giá.',
        color: const Color(0xFF981554), // Màu Havoc theo bạn quy định
      ),
      Character(
        name: 'Cartethyia',
        rarity: '5-Star',
        element: 'Aero',
        weapon: 'Sword',
        imageUrl: 'assets/images/Cartethyia.jpg',
        description:
            'Cartethyia là một Resonator hệ Aero bẩm sinh trong Wuthering Waves. '
            'Khắp Rinascita, cô được tôn xưng là “Thiếu Nữ Ban Phúc” – Fleurdelys, '
            'và trong một số ghi chép khác, là “Thiếu Nữ Tử Vì Đạo”. '
            'Là một nhân vật trọng yếu trong lịch sử của vùng đất này, cô sở hữu ảnh hưởng sâu rộng cùng những mối liên hệ '
            'với Sentinel Imperator, Threnodian Leviathan và Dark Tide. '
            'Thế nhưng trên hết, Cartethyia mong muốn thoát khỏi những danh xưng trói buộc mình '
            'để sống như một hiệp sĩ lãng du chính nghĩa – được tự quyết con đường của bản thân.',
        color: const Color(0xFF30C8A0), // Aero
      ),
      Character(
        name: 'Augusta',
        rarity: '5-Star',
        element: 'Electro',
        weapon: 'Gauntlets',
        imageUrl: 'assets/images/Augusta.jpg',
        description:
            'Augusta là một Resonator hệ Electro bẩm sinh trong Wuthering Waves. '
            'Cô là Ephor quả cảm của Septimont, mang trong mình ý chí thép cùng tinh thần bất khuất. '
            'Dù phải trải qua tuổi thơ đầy gian khổ và những năm tháng khốc liệt khi còn là một Gladiator, '
            'Augusta vẫn giữ được sự kiên cường, khiêm nhường và phẩm chất lãnh đạo hiếm có. '
            'Dẫu chỉ là một người bình thường, cô đã tinh thông chiến đấu, chiến lược và Forte của mình '
            'qua vô số trận chiến — đạt đến tầm cao mà rất ít ai có thể vươn tới.',
        color: const Color(0xFFA632B0), // Electro
      ),
      Character(
        name: 'Changli',
        rarity: '5-Star',
        element: 'Fusion',
        weapon: 'Sword',
        imageUrl: 'assets/images/Changli.jpg',
        description:
            'Changli là một Resonator hệ Fusion tự nhiên trong Wuthering Waves. '
            'Cô từng giữ chức Tổng Thư ký của Central Secretariat tại Mingting, thủ đô của Huanglong, '
            'và hiện là Cố vấn cho Magistrate Jinhsi tại Jinzhou. '
            'Xuất thân từ một tuổi thơ khắc nghiệt, Changli trưởng thành thành một quan chức sắc sảo, '
            'điềm tĩnh và nhiều kinh nghiệm, sở hữu tầm nhìn chiến lược sắc bén cho cả chính trị lẫn đời sống dân sự. '
            'Sự thông tuệ và bí ẩn của cô khiến Changli trở thành một nhân vật khó đoán nhưng vô cùng đáng tin cậy.',
        color: const Color(0xFFC82A4B), // Fusion
      ),
      Character(
        name: 'Carlotta',
        rarity: '5-Star',
        element: 'Glacio',
        weapon: 'Broadblade',
        imageUrl: 'assets/images/Carlotta.jpg',
        description:
            'Carlotta là một Resonator hệ Glacio đột biến trong Wuthering Waves. '
            'Cô là con gái thứ hai của gia tộc Montelli danh giá tại Rinascita, '
            'mang trong mình khí chất cao quý cùng gu thẩm mỹ tinh tế. '
            'Carlotta sở hữu trí tuệ vượt trội, sự tự tin, mưu lược sắc sảo và tham vọng nâng tầm Ragunna City. '
            'Cô tận tâm duy trì quyền lực của gia tộc, đồng thời sẵn sàng loại bỏ bất kỳ thế lực nào cản trở con đường đó.',
        color: const Color(0xFF39B1D1), // Glacio
      ),
      Character(
        name: 'Phoebe',
        rarity: '4-Star',
        element: 'Spectro',
        weapon: 'Rectifier',
        imageUrl: 'assets/images/Phoebe.jpg',
        description:
            'Phoebe là một Resonator hệ Spectro với xuất thân chưa rõ ràng trong Wuthering Waves. '
            'Cô là một Tín Đồ của Order of the Deep — một thiếu nữ trầm lặng, nhân hậu và đầy lòng vị tha. '
            'Được nuôi dưỡng cả đời trong giáo hội, Phoebe tận tụy thực hành giáo lý với lòng thành kính không thay đổi. '
            'Cô luôn đối xử ấm áp với mọi người, dành thiện ý chân thành và sự tôn trọng tuyệt đối dành cho Sentinel Imperator.',
        color: const Color(0xFFB8A81E), // Spectro
      ),
    ];
  }
}
