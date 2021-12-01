class DeleteModel
{
  String code;
  String type;

  DeleteModel(this.type,this.code);

  void setTYpe(String t)
  {
    this.type=t;
  }

  String getType() {return this.type;}

  void setCode(String c)
  {
      this.code=c;
  }

  String getCode() {return this.code;}
}
