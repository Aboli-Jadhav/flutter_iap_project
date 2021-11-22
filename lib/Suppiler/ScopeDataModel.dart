class ScopeDataModel
{
      var scopeItem;
      ScopeDataModel.toJSON(Map<String,dynamic> val)
      {
            scopeItem=val['name'].toString();
      }
}