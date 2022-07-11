package cn.sky1998.mango.gen.common.util;

import cn.sky1998.mango.common.utils.StringUtils;
import cn.sky1998.mango.framework.aspect.DictAspect;
import cn.sky1998.mango.gen.common.constant.GenConstants;
import cn.sky1998.mango.gen.domain.GenTable;
import cn.sky1998.mango.gen.domain.GenTableColumn;
import cn.sky1998.mango.gen.properties.GenConfig;
import org.apache.commons.lang3.RegExUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;

/**
 * 代码生成器 工具类
 * 
 * @author tcy@1753163342@qq.com
 */
@Component
public class GenUtils
{
    private static Logger log = LoggerFactory.getLogger(GenUtils.class);

    @Autowired
    private GenConfig genConfig;

    /**
     * 初始化表信息
     */
    public void initTable(GenTable genTable, String operName)
    {
        genTable.setClassName(convertClassName(genTable.getTableName()));
        genTable.setPackageName(genConfig.getPackageName());
        genTable.setModuleName(getModuleName(genConfig.getPackageName()));
        genTable.setBusinessName(getBusinessName(genTable.getTableName()));
        genTable.setFunctionName(replaceText(genTable.getTableComment()));
        genTable.setFunctionAuthor(genConfig.getAuthor());
        genTable.setCreateBy(operName);
    }

    /**
     * 初始化列属性字段
     */
    public static void initColumnField(GenTableColumn column, GenTable table)
    {
        String dataType = getDbType(column.getColumnType());
        String columnName = column.getColumnName();
        column.setTableId(table.getTableId());
        column.setCreateBy(table.getCreateBy());
        // 设置java字段名
        column.setJavaField(StringUtils.toCamelCase(columnName));
        // 设置默认类型
        column.setJavaType(GenConstants.TYPE_STRING);

        //字符串类型
        if (arraysContains(GenConstants.COLUMNTYPE_STR, dataType) || arraysContains(GenConstants.COLUMNTYPE_TEXT, dataType))
        {
            // 字符串长度超过500设置为文本域
            Integer columnLength = getColumnLength(column.getColumnType());
            String htmlType = columnLength >= 500 || arraysContains(GenConstants.COLUMNTYPE_TEXT, dataType) ? GenConstants.HTML_TEXTAREA : GenConstants.HTML_INPUT;
            column.setHtmlType(htmlType);

            //提取出来字段长度set
            if (column.getColumnType().contains("(")){
                Integer integer = StringUtils.extractDigital(column.getColumnType());
                column.setFieldNum(integer);
            }

        }
        //时间类型
        else if (arraysContains(GenConstants.COLUMNTYPE_TIME, dataType))
        {
            column.setJavaType(GenConstants.TYPE_DATE);
            column.setHtmlType(GenConstants.HTML_DATETIME);
        }
        //数字类型
        else if (arraysContains(GenConstants.COLUMNTYPE_NUMBER, dataType))
        {
            column.setHtmlType(GenConstants.HTML_INPUT);

            // 如果是浮点型 统一用BigDecimal
            String[] str = StringUtils.split(StringUtils.substringBetween(column.getColumnType(), "(", ")"), ",");
            if (str != null && str.length == 2 && Integer.parseInt(str[1]) > 0)
            {
                if (column.getColumnType().contains(",")){
                    Integer[] integers = StringUtils.extractDigitalsToPoint(column.getColumnType());
                    column.setFieldNum(integers[0]);
                    column.setPointNum(integers[1]);
                }
                column.setJavaType(GenConstants.TYPE_BIGDECIMAL);

            }
            // 如果是整形
            else if (str != null && str.length == 1 && Integer.parseInt(str[0]) <= 10)
            {
                //提取出来字段长度set
                if (column.getColumnType().contains("(")){
                    Integer integer = StringUtils.extractDigital(column.getColumnType());
                    column.setFieldNum(integer);
                }

                column.setJavaType(GenConstants.TYPE_INTEGER);
            }
            // 长整形
            else
            {
                //提取出来字段长度set
                if (column.getColumnType().contains("(")){
                    Integer integer = StringUtils.extractDigital(column.getColumnType());
                    column.setFieldNum(integer);
                }
                column.setJavaType(GenConstants.TYPE_LONG);

            }
        }

        // 插入字段（默认所有字段都需要插入）
        column.setIsInsert(GenConstants.REQUIRE);

        // 编辑字段
        if (!arraysContains(GenConstants.COLUMNNAME_NOT_EDIT, columnName) && !column.isPk())
        {
            column.setIsEdit(GenConstants.REQUIRE);
        }
        // 列表字段
        if (!arraysContains(GenConstants.COLUMNNAME_NOT_LIST, columnName) && !column.isPk())
        {
            column.setIsList(GenConstants.REQUIRE);
        }
        // 查询字段
        if (!arraysContains(GenConstants.COLUMNNAME_NOT_QUERY, columnName) && !column.isPk())
        {
            column.setIsQuery(GenConstants.REQUIRE);
        }

        // 查询字段类型
        if (StringUtils.endsWithIgnoreCase(columnName, "name"))
        {
            column.setQueryType(GenConstants.QUERY_LIKE);
        }
        // 状态字段设置单选框
        if (StringUtils.endsWithIgnoreCase(columnName, "status"))
        {
            column.setHtmlType(GenConstants.HTML_RADIO);
        }
        // 类型&性别字段设置下拉框
        else if (StringUtils.endsWithIgnoreCase(columnName, "type")
                || StringUtils.endsWithIgnoreCase(columnName, "sex"))
        {
            column.setHtmlType(GenConstants.HTML_SELECT);
        }
        // 图片字段设置图片上传控件
        else if (StringUtils.endsWithIgnoreCase(columnName, "image"))
        {
            column.setHtmlType(GenConstants.HTML_IMAGE_UPLOAD);
        }
        // 文件字段设置文件上传控件
        else if (StringUtils.endsWithIgnoreCase(columnName, "file"))
        {
            column.setHtmlType(GenConstants.HTML_FILE_UPLOAD);
        }
        // 内容字段设置富文本控件
        else if (StringUtils.endsWithIgnoreCase(columnName, "content"))
        {
            column.setHtmlType(GenConstants.HTML_EDITOR);
        }
    }

    /**
     * 校验数组是否包含指定值
     * 
     * @param arr 数组
     * @param targetValue 值
     * @return 是否包含
     */
    public static boolean arraysContains(String[] arr, String targetValue)
    {
        return Arrays.asList(arr).contains(targetValue);
    }

    /**
     * 获取模块名
     * 
     * @param packageName 包名
     * @return 模块名
     */
    public static String getModuleName(String packageName)
    {
        int lastIndex = packageName.lastIndexOf(".");
        int nameLength = packageName.length();
        String moduleName = StringUtils.substring(packageName, lastIndex + 1, nameLength);
        return moduleName;
    }

    /**
     * 获取业务名
     * 
     * @param tableName 表名
     * @return 业务名
     */
    public static String getBusinessName(String tableName)
    {
        int lastIndex = tableName.lastIndexOf("_");
        int nameLength = tableName.length();
        String businessName = StringUtils.substring(tableName, lastIndex + 1, nameLength);
        return businessName;
    }

    /**
     * 表名转换成Java类名
     *
     * @param tableName 表名称
     * @return 类名
     */
    public String convertClassName(String tableName)
    {
        boolean autoRemovePre = genConfig.getAutoRemovePre();
        String tablePrefix = genConfig.getTablePrefix();
        if (autoRemovePre && StringUtils.isNotEmpty(tablePrefix))
        {
            String[] searchList = StringUtils.split(tablePrefix, ",");
            tableName = replaceFirst(tableName, searchList);
        }
        return StringUtils.convertToCamelCase(tableName);
    }

    /**
     * 批量替换前缀
     * 
     * @param replacementm 替换值
     * @param searchList 替换列表
     * @return
     */
    public static String replaceFirst(String replacementm, String[] searchList)
    {
        String text = replacementm;
        for (String searchString : searchList)
        {
            if (replacementm.startsWith(searchString))
            {
                text = replacementm.replaceFirst(searchString, "");
                break;
            }
        }
        return text;
    }

    /**
     * 关键字替换
     * 
     * @param text 需要被替换的名字
     * @return 替换后的名字
     */
    public static String replaceText(String text)
    {
        return RegExUtils.replaceAll(text, "(?:表|若依)", "");
    }

    /**
     * 获取数据库类型字段
     * 
     * @param columnType 列类型
     * @return 截取后的列类型
     */
    public static String getDbType(String columnType)
    {
        if (StringUtils.indexOf(columnType, "(") > 0)
        {
            return StringUtils.substringBefore(columnType, "(");
        }
        else
        {
            return columnType;
        }
    }

    /**
     * 获取字段长度
     * 
     * @param columnType 列类型
     * @return 截取后的列类型
     */
    public static Integer getColumnLength(String columnType)
    {
        if (StringUtils.indexOf(columnType, "(") > 0)
        {
            String length = StringUtils.substringBetween(columnType, "(", ")");
            return Integer.valueOf(length);
        }
        else
        {
            return 0;
        }
    }

    /**
     * 下划线转驼峰
     */
    public static String toCamelCase(String s) {
        if (s == null) {
            return null;
        }
        s = s.toLowerCase();
        StringBuilder sb = new StringBuilder(s.length());
        boolean upperCase = false;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);

            if (c == '_') {
                upperCase = true;
            } else if (upperCase) {
                sb.append(Character.toUpperCase(c));
                upperCase = false;
            } else {
                sb.append(c);
            }
        }
        return sb.toString();
    }


    /**
     * 下划线转驼峰命名
     */
    public static String toUnderScoreCase(String str) {
        if (str == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        // 前置字符是否大写
        boolean preCharIsUpperCase = true;
        // 当前字符是否大写
        boolean curreCharIsUpperCase = true;
        // 下一字符是否大写
        boolean nexteCharIsUpperCase = true;
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            if (i > 0) {
                preCharIsUpperCase = Character.isUpperCase(str.charAt(i - 1));
            } else {
                preCharIsUpperCase = false;
            }

            curreCharIsUpperCase = Character.isUpperCase(c);

            if (i < (str.length() - 1)) {
                nexteCharIsUpperCase = Character.isUpperCase(str.charAt(i + 1));
            }

            if (preCharIsUpperCase && curreCharIsUpperCase && !nexteCharIsUpperCase) {
                sb.append("_");
            } else if ((i != 0 && !preCharIsUpperCase) && curreCharIsUpperCase) {
                sb.append("_");
            }
            sb.append(Character.toLowerCase(c));
        }

        return sb.toString();
    }



    /**
     * 数据类型转化JAVA
     * @param sqlType：类型名称
     * @return
     */
    public static String toSqlToJava(String sqlType) {
        if( sqlType == null || sqlType.trim().length() == 0 ) return sqlType;
        sqlType = sqlType.toLowerCase();

        switch(sqlType){
            case "nvarchar":return "String";
            case "char":return "String";
            case "varchar":return "String";
            case "text":return "String";
            case "nchar":return "String";
            case "blob":return "byte[]";
            case "integer":return "Long";
            case "tinyint":return "Integer";
            case "smallint":return "Integer";
            case "mediumint":return "Integer";
            case "bit":return "Boolean";
            case "bigint":return "java.math.BigInteger";
            case "float":return "Fload";
            case "double":return "Double";
            case "decimal":return "java.math.BigDecimal";
            case "boolean":return "Boolean";
            case "id":return "Long";
            case "date":return "java.util.Date";
            case "datetime":return "java.util.Date";
            case "year":return "java.util.Date";
            case "time":return "java.sql.Time";
            case "timestamp":return "java.sql.Timestamp";
            case "numeric":return "java.math.BigDecimal";
            case "real":return "java.math.BigDecimal";
            case "money":return "Double";
            case "smallmoney":return "Double";
            case "image":return "byte[]";
            default:
                log.info("-----------------》转化失败：未发现的类型"+sqlType);
                break;
        }
        return sqlType;
    }

    /**
     * 数据类型转化JAVA
     * @param javaType：类型名称
     * @return
     */
    public static String toJavaToSql(String javaType,Integer fieldNum,Integer pointNum) {
        if( javaType == null || javaType.trim().length() == 0 ) return javaType;
      //  javaType = javaType.toLowerCase();

        switch(javaType){
            case "String":
                 if (fieldNum==null){
                     return "varchar";
                 }
                return "varchar"+"("+fieldNum+")";
            case "Integer":
                if (fieldNum==null){
                    return "int";
                }
                return "int"+"("+fieldNum+")";
            case "Double":return "Double";
            case "java.util.Date":return "Date";
            case "Date":return "Date";
            case "Datetime":return "Datetime";
            case "BigDecimal":
                if (fieldNum==null){
                    return "decimal";
                }
                return "decimal"+"("+fieldNum+","+pointNum+")";
            case "Text":return "text";
            case "Blod":return "blod";

            default:
                log.info("-----------------》转化失败：未发现的类型"+javaType);
                break;
        }
        return javaType;
    }

}
