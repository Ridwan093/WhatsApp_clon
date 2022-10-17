enum MessageEnum { texe('text'), image('image'), audio('audio'), video('video'), gif('gif')

const MessageEnum(this.type),
final String type;


}

extension ConvertingMessage on String{
  MessagEnum toEnum(){
    switch (this) {
      case  'text' :
      return MessagEnum.text;
       case  'audio' :
      return MessagEnum.audio;
       case  'image' :
      return MessagEnum.image;
       case  'gif' :
      return MessagEnum.gif;
       case  'video' :
      return MessagEnum.vide;
     
        
     
      default:
      return MessagEnum.text;
    }
  }
}