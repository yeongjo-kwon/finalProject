package com.it.apt.sample.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sample")
public class SampleController {
   
   private Logger logger = LoggerFactory.getLogger(SampleController.class);
      
   @RequestMapping("/Analytics.do")
   public void analytics() {
      logger.info("Analytics 화면 보여주기!");
   }

   @RequestMapping("/eCommerce.do")
   public void eCommerce() {
      logger.info("eCommerce 화면 보여주기!");
   }

   @RequestMapping("/email.do")
   public void email() {
      logger.info("email 화면 보여주기!");
   }

   @RequestMapping("/chat.do")
   public void chat() {
      logger.info("chat 화면 보여주기!");
   }

   @RequestMapping("/calendar.do")
   public void calendar() {
      logger.info("calendar 화면 보여주기!");
   }
   
   @RequestMapping("/app-invoice-list.do")
   public void app_invoice_list() {
      logger.info("app-invoice-list.jsp 화면 보여주기!");
   }
   
   @RequestMapping("/app-invoice-add.do")
   public void app_invoice_add() {
      logger.info("app-invoice-add.jsp 화면 보여주기!");
   }
   
   @RequestMapping("/app-invoice-edit.do")
   public void app_invoice_edit() {
      logger.info("app-invoice-edit.jsp 화면 보여주기!");
   }
   
   @RequestMapping("/app-invoice-preview.do")
   public void app_invoice_preview() {
      logger.info("app-invoice-preview.jsp 화면 보여주기!");
   }
   
   @RequestMapping("/app-ecommerce-shop.do")
   public void app_ecommerce_shop() {
      logger.info("app-ecommerce-shop.do 화면 보여주기!");
   }

   @RequestMapping("/app-ecommerce-checkout.do")
   public void app_ecommerce_checkout() {
      logger.info("app-ecommerce-checkout.do 화면 보여주기!");
   }

   @RequestMapping("/app-ecommerce-wishlist.do")
   public void app_ecommerce_wishlist() {
      logger.info("app-ecommerce-wishlist.do 화면 보여주기!");
   }

   @RequestMapping("/app-ecommerce-details.do")
   public void app_ecommerce_details() {
      logger.info("app-ecommerce-details.do 화면 보여주기!");
   }
   
   @RequestMapping("/app-user-list.do")
   public void app_ecommerce_list() {
      logger.info("app-user-list.do 화면 보여주기!");
   }
   
   @RequestMapping("/app-user-edit.do")
   public void app_ecommerce_edit() {
      logger.info("app-user-edit.do 화면 보여주기!");
   }
   
   @RequestMapping("/app-user-view.do")
   public void app_ecommerce_view() {
      logger.info("app-user-view.do 화면 보여주기!");
   }

   @RequestMapping("/page-auth-login-v1.do")
   public void page_auth_login_v1() {
      logger.info("page-auth-login-v1 화면 보여주기!");
   }

   @RequestMapping("/page-auth-register-v1.do")
   public void page_auth_register_v1() {
      logger.info("page-auth-register-v1 화면 보여주기!");
   }

   @RequestMapping("/page-auth-forgot-password-v1.do")
   public void page_auth_forgot_password_v1() {
      logger.info("page-auth-forgot-password-v1 화면 보여주기!");
   }

   @RequestMapping("/page-auth-reset-password-v1.do")
   public void page_auth_reset_password_v1() {
      logger.info("page-auth-reset-password-v1 화면 보여주기!");
   }

   @RequestMapping("/page-account-settings.do")
   public void page_account_settings() {
      logger.info("page-account-settings.do 화면 보여주기!");
   }

   @RequestMapping("/page-profile.do")
   public void page_profile() {
      logger.info("page-profile.do 화면 보여주기!");
   }

   @RequestMapping("/page-faq.do")
   public void page_faq() {
      logger.info("page-faq.do 화면 보여주기!");
   }

   @RequestMapping("/page-pricing.do")
   public void page_pricing() {
      logger.info("page-pricing.do 화면 보여주기!");
   }

   @RequestMapping("/page-blog-list.do")
   public void page_blog_list() {
      logger.info("page-blog-list.do 화면 보여주기!");
   }
   
   @RequestMapping("/page-blog-detail.do")
   public void page_blog_detail() {
      logger.info("page-blog-detail.do 화면 보여주기!");
   }

   @RequestMapping("/page-blog-edit.do")
   public void page_blog_edit() {
      logger.info("page-blog-edit.do 화면 보여주기!");
   }

   @RequestMapping("/page-misc-error.do")
   public void page_blog_misc_error() {
      logger.info("page-misc-error.do 화면 보여주기!");
   }

   @RequestMapping("/ui-typography.do")
   public void ui_typography() {
      logger.info("ui-typography.do 화면 보여주기!");
   }

   @RequestMapping("/ui-colors.do")
   public void ui_colors() {
      logger.info("ui-colors.do 화면 보여주기!");
   }

   @RequestMapping("/ui-feather.do")
   public void ui_feather() {
      logger.info("ui-feather.do 화면 보여주기!");
   }

   @RequestMapping("/card-basic.do")
   public void card_basic() {
      logger.info("card-basic.do 화면 보여주기!");
   }
   
   @RequestMapping("/card-advance.do")
   public void card_advance() {
      logger.info("card-advance.do 화면 보여주기!");
   }
   
   @RequestMapping("/card-statistics.do")
   public void card_statistics() {
      logger.info("card-statistics.do 화면 보여주기!");
   }
   
   @RequestMapping("/card-analytics.do")
   public void card_analytics() {
      logger.info("card-analytics.do 화면 보여주기!");
   }
   
   @RequestMapping("/card-actions.do")
   public void card_actions() {
      logger.info("card-actions.do 화면 보여주기!");
   }

   @RequestMapping("/form-input-mask.do")
   public void form_input_mask() {
      logger.info("form-input-mask.do 화면 보여주기!");
   }
   
   @RequestMapping("/form-date-time-picker.do")
   public void form_date_time_picker() {
      logger.info("form-date-time-picker.do 화면 보여주기!");
   }
   
   @RequestMapping("/form-layout.do")
   public void form_layout() {
      logger.info("form-layout.do 화면 보여주기!");
   }
   
   @RequestMapping("/form-wizard.do")
   public void form_wizard() {
      logger.info("form-wizard.do 화면 보여주기!");
   }
   
   @RequestMapping("/form-validation.do")
   public void form_validation() {
      logger.info("form-validation.do 화면 보여주기!");
   }
   
   @RequestMapping("/form-repeater.do")
   public void form_repeater() {
      logger.info("form-repeater.do 화면 보여주기!");
   }
   
   @RequestMapping("/table-datatable-basic.do")
   public void form_basic() {
      logger.info("table-datatable-basic.do 화면 보여주기!");
   }

   @RequestMapping("/table-datatable-advanced.do")
   public void form_advanced() {
      logger.info("table-datatable-advanced.do 화면 보여주기!");
   }
   
   @RequestMapping("/chart-apex.do")
   public void chart_apex() {
      logger.info("chart-apex.do 화면 보여주기!");
   }
   
   @RequestMapping("/chart-chartjs.do")
   public void chart_chartjs() {
      logger.info("chart-chartjs.do 화면 보여주기!");
   }

   @RequestMapping("/maps-leaflet.do")
   public void maps_leaflet() {
      logger.info("maps-leaflet.do 화면 보여주기!");
   }
   
}