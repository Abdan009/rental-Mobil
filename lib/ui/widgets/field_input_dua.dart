part of 'widgets.dart';

class FieldInputDua extends StatefulWidget {
  final List<TextInputFormatter> inputFormater;
  final TextEditingController textEditingController;
  final String text;
  final TextInputType typeText;
  final double height;
  final double width;
  final int maxLines;
  final bool obsecureText;
  final Function(String) onChange;
  final bool isEnable;
  final Widget suffixIcon;
  final Function onTap;
  final bool calendar;
  final DateFormat format;
  final Function dateTime;
  final TextStyle textStyle;

  FieldInputDua(
    this.textEditingController,
    this.text, {
    this.typeText,
    this.maxLines,
    this.inputFormater,
    this.onChange,
    this.textStyle,
    this.obsecureText = false,
    this.height,
    this.width,
    this.isEnable = true,
    this.suffixIcon,
    this.onTap,
    this.calendar = false,
    this.format,
    this.dateTime,
  });

  @override
  _FieldInputDuaState createState() => _FieldInputDuaState();
}

class _FieldInputDuaState extends State<FieldInputDua> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height ?? 60,
        child: (!widget.calendar)
            ? TextField(
                controller: widget.textEditingController,
                inputFormatters:(widget.inputFormater!=null)?widget.inputFormater:null,
                maxLines: widget.maxLines ?? 20,
                enabled: widget.isEnable,
                obscureText: widget.obsecureText,
                textAlignVertical: TextAlignVertical.center,
                onChanged: widget.onChange ?? null,
                keyboardType: (widget.typeText == null)
                    ? TextInputType.text
                    : widget.typeText,
                style:widget.textStyle?? blackTextFont,
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(top: 30, right: 10, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: widget.text,
                    //icon: Icon(Icons.calendar_today),
                    suffixIcon: widget.suffixIcon ?? SizedBox(),
                    hintText: widget.text),
              )
            : DateTimeField(

                ///controller: widget.textEditingController,
                format: widget.format,
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(top: 30, right: 10, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: widget.text,
                    //icon: Icon(Icons.calendar_today),
                    suffixIcon: widget.suffixIcon ?? SizedBox(),
                    hintText: widget.text),
                onShowPicker: widget.dateTime));
  }
}
