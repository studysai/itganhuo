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
package cn.itganhuo.app.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.itganhuo.app.entity.Template;
import cn.itganhuo.app.service.TemplateService;

/**
 * <h2>[类用途简述]</h2>
 * <dl>
 * <dt>功能描述</dt>
 * <dd>无</dd>
 * <dt>使用规范</dt>
 * <dd>无</dd>
 * </dl>
 * 
 * @version 0.0.1-SNAPSHOT
 * @author 天津-小朱
 */
@Controller
@RequestMapping("/emailTemplate")
public class TemplateController {

	private static final Logger logger = LoggerFactory.getLogger(TemplateController.class);

	@Autowired
	private TemplateService templateService;

	/**
	 * 返回email模板集合
	 * 
	 * @param model
	 * @return
	 * @author 小朱
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listEmailTemplate(Model model) {
		model.addAttribute("emailTemplateList", this.templateService.loadAll());
		return "emailTemplate/list";
	}

	/**
	 * 准备插入email模板的数据，跳转到插入页面
	 * 
	 * @param model
	 * @return
	 * @author 小朱
	 */
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertEmailTemplate(Model model) {
		Template template = new Template();
		model.addAttribute("emailTemplate", template);
		return "emailTemplate/insert";
	}

	/**
	 * 插入一条email模板信息 成功跳转到模板信息集合页面并进行日志记录 失败重新进入插入业务
	 * 
	 * @param template
	 * @return
	 * @author 小朱
	 */
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertEmailTemplate(Template template) {
		if (templateService.insert(template) != 0) {
			if (logger.isInfoEnabled()) {
				logger.info("插入email信息" + template.getName() + "成功");
			}
			return "redirect:list";
		} else
			return "redirect:list";
	}

}
