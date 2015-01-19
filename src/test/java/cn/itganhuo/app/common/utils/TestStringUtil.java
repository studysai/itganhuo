/*
 * 1. This project consists of JAVA private school online learning community group Friends co-creator
 *  [QQ group 329232140].
 * 2. See the list of IT dry technology sharing network [http://www.itganhuo.cn/teams].
 * 3. The author does not guarantee the quality of the project and its stability, reliability, and security
 *  does not bear any responsibility.
 * 1、本项目由JAVA私塾在线学习社区群友共同创作[QQ群329232140]；
 * 2、作者名单详见IT干货技术分享网[http://www.itganhuo.cn/teams]；
 * 3、作者不保证本项目质量并对其稳定性、可靠性和安全性不承担任何责任。
 */
package cn.itganhuo.app.common.utils;

import org.junit.Assert;
import org.junit.Test;

import cn.itganhuo.app.common.utils.StringUtil;

/**
 * <h2>测试StringUtil中的方法是否正确</h2>
 * <dl>
 * <dt>功能描述</dt>
 * <dd>无</dd>
 * <dt>使用规范</dt>
 * <dd>无</dd>
 * </dl>
 * 
 * @version 0.0.1-SNAPSHOT
 * @author 深圳-小兴
 */
public class TestStringUtil {

	@Test
	public void testifContainsSpecialStr() {
		Assert.assertFalse(StringUtil.ifContainsSpecialStr("adm!in!123"));
		Assert.assertTrue(StringUtil.ifContainsSpecialStr("admin123"));
	}
	
	@Test
	public void testifContainsSpecialStr2Replace() {
		Assert.assertEquals(StringUtil.ifContainsSpecialStr2Replace("*adm!~in!1 2 3%"), "admin1 2 3");
		Assert.assertEquals(StringUtil.ifContainsSpecialStr2Replace("*adm!~！in!123%"), "adm！in123");
	}
}
