package org.etp.portalKit.common.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * This class provide APIs to handler propertiesManager related stuff.
 */
public class PropManagerUtils {

    /**
     * @param arrayString
     * @return object
     */
    public static Object fromString(String arrayString) {
        if (org.apache.commons.lang.StringUtils.isBlank(arrayString))
            return "";
        if (arrayString.startsWith("[") && arrayString.endsWith("]")) {
            List<String> list = new ArrayList<String>();
            String arrayStringClone = null;
            arrayStringClone = org.apache.commons.lang.StringUtils.removeEnd(arrayString, "]");
            arrayStringClone = org.apache.commons.lang.StringUtils.removeStart(arrayStringClone, "[");
            list = Arrays.asList(org.apache.commons.lang.StringUtils.stripAll(org.apache.commons.lang.StringUtils
                    .split(arrayStringClone, ',')));
            return list;
        }

        return arrayString;
    }
}