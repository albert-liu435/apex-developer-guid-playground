public class PickListValuesUtil {
/*
        通过sObjectName和指定字段获取PickList的value值
    */
    public static Map<String, object> getPicklistValues(String sObjectName, String sFieldName){
        Map<String, object> picValues= new Map<String, object>();
        Map<String, Schema.SObjectType> sObjectDescribeMap = Schema.getGlobalDescribe();
        if (sObjectDescribeMap.containsKey(sObjectName)) {
            Map<String, Schema.SobjectField> sObjectFieldsMap =
               sObjectDescribeMap.get(sObjectName).getDescribe().fields.getMap();
            if (sObjectFieldsMap.containsKey(sFieldName)) {
                Schema.DescribeFieldResult sObjectFieldDescribe = sObjectFieldsMap.get(sFieldName).getDescribe();
                List<Schema.PicklistEntry> lPickEntryList = sObjectFieldDescribe.getPicklistValues();
                for (Schema.PicklistEntry tPicklistEntry : lPickEntryList) {
                    picValues.put(tPicklistEntry.getValue(), new Map<String,object>{
                        'value' => tPicklistEntry.getValue(),
                        'isActive' => tPicklistEntry.isActive(),
                        'isDefaultValue' => tPicklistEntry.isDefaultValue(),
                        'label' => tPicklistEntry.getLabel()
                    });
                }
            } else {
                //TODO 不存在此字段的执行
            }
        } else {
            // TODO 不存在此sObject的执行
        }
        return picValues;
    }
}

//{初中={isActive=true, isDefaultValue=false, label=初中, value=初中}, 博士生={isActive=true, isDefaultValue=false, label=博士生, value=博士生}, 大学={isActive=true, isDefaultValue=false, label=大学, value=大学}, 小学={isActive=true, isDefaultValue=false, label=小学, value=小学}, 教授={isActive=true, isDefaultValue=false, label=教授, value=教授}, 研究生={isActive=true, isDefaultValue=false, label=研究生, value=研究生}, 高中={isActive=true, isDefaultValue=false, label=高中, value=高中}}