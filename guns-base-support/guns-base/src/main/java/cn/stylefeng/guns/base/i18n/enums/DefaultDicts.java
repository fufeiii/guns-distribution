package cn.stylefeng.guns.base.i18n.enums;

import lombok.Getter;

/**
 * 默认的翻译字段枚举
 *
 * @author fengshuonan
 * @Date 2020/3/18 13:24
 */
@Getter
public enum DefaultDicts {

    MENU_CHANGE_PASSWORD_1("MENU_CHANGE_PASSWORD", TranslationEnum.CHINESE, "修改密码"),
    MENU_CHANGE_PASSWORD_2("MENU_CHANGE_PASSWORD", TranslationEnum.ENGLISH, "change password"),

    FIELD_ACCOUNT_1("FIELD_ACCOUNT", TranslationEnum.CHINESE, "账号"),
    FIELD_ACCOUNT_2("FIELD_ACCOUNT", TranslationEnum.ENGLISH, "account"),

    FIELD_NAME_1("FIELD_NAME", TranslationEnum.CHINESE, "名称"),
    FIELD_NAME_2("FIELD_NAME", TranslationEnum.ENGLISH, "name"),

    FIELD_POST_1("FIELD_POST", TranslationEnum.CHINESE, "职位"),
    FIELD_POST_2("FIELD_POST", TranslationEnum.ENGLISH, "post"),

    FIELD_PHONE_1("FIELD_PHONE", TranslationEnum.CHINESE, "电话"),
    FIELD_PHONE_2("FIELD_PHONE", TranslationEnum.ENGLISH, "phone"),

    FIELD_CREATE_TIME_1("FIELD_CREATE_TIME", TranslationEnum.CHINESE, "创建时间"),
    FIELD_CREATE_TIME_2("FIELD_CREATE_TIME", TranslationEnum.ENGLISH, "create time"),

    FIELD_STATUS_1("FIELD_STATUS", TranslationEnum.CHINESE, "状态"),
    FIELD_STATUS_2("FIELD_STATUS", TranslationEnum.ENGLISH, "status"),

    FIELD_OPERATION_1("FIELD_OPERATION", TranslationEnum.CHINESE, "操作"),
    FIELD_OPERATION_2("FIELD_OPERATION", TranslationEnum.ENGLISH, "operation"),

    TITLE_ADD_USER_1("FIELD_NAME", TranslationEnum.CHINESE, "添加用户"),
    TITLE_ADD_USER_2("FIELD_NAME", TranslationEnum.ENGLISH, "add user"),

    TITLE_EDIT_USER_1("TITLE_EDIT_USER", TranslationEnum.CHINESE, "编辑用户"),
    TITLE_EDIT_USER_2("TITLE_EDIT_USER", TranslationEnum.ENGLISH, "edit user"),

    TITLE_ROLE_ASSIGN_1("TITLE_ROLE_ASSIGN", TranslationEnum.CHINESE, "角色分配"),
    TITLE_ROLE_ASSIGN_2("TITLE_ROLE_ASSIGN", TranslationEnum.ENGLISH, "role assign"),

    FIELD_DEPT_1("FIELD_DEPT", TranslationEnum.CHINESE, "部门"),
    FIELD_DEPT_2("FIELD_DEPT", TranslationEnum.ENGLISH, "dept");

    /**
     * 编码
     */
    private String tranCode;

    /**
     * 1:中文  2:英语
     */
    private TranslationEnum translationLanguages;

    /**
     * 翻译的值
     */
    private String tranValue;

    DefaultDicts(String tranCode, TranslationEnum translationLanguages, String tranValue) {
        this.tranCode = tranCode;
        this.translationLanguages = translationLanguages;
        this.tranValue = tranValue;
    }
}
