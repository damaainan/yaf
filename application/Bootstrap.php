<?php
   /**
   * @name Bootstrap
   * @author yantze
   * @desc 所有在Bootstrap类中, 以_init开头的方法, 都会被Yaf调用,
   * @see http://www.php.net/manual/en/class.yaf-bootstrap-abstract.php
   * 这些方法, 都接受一个参数:Yaf_Dispatcher $dispatcher
   * 调用的次序, 和申明的次序相同
   print_r(Yaf_Application::app());
   */
   class Bootstrap extends Yaf_Bootstrap_Abstract{
      public function _initConfig() {
         //把配置保存起来
         $this->_config = Yaf_Application::app()->getConfig();
         Yaf_Registry::set('config', $this->_config);
      }

      public function _initPlugin(Yaf_Dispatcher $dispatcher) {
         //注册一个插件
         $objSamplePlugin = new SamplePlugin();
         $dispatcher->registerPlugin($objSamplePlugin);

         //$userPlugin = new UserPlugin();
         //$dispatcher->registerPlugin($userPlugin);

      }

      public function _initRoute(Yaf_Dispatcher $dispatcher) {
         //在这里注册自己的路由协议,默认使用简单路由
         //print_r( $routes = Yaf_Dispatcher::getInstance()->getRouter()->getRoute("default"));
         Yaf_Dispatcher::getInstance()->getRouter()->addRoute(
            "supervar",new Yaf_Route_Supervar("r")
         );
         Yaf_Dispatcher::getInstance()->getRouter()->addRoute(
            "simple", new Yaf_Route_simple('m', 'c', 'a')
         );
      }

      public function _initView(Yaf_Dispatcher $dispatcher){
         //在这里注册自己的view控制器，例如smarty,firekylin
      }

      public function _initDb(Yaf_Dispatcher $dispatcher){
         $this->_db = new Db($this->_config->mysql->read->toArray());
         Yaf_Registry::set('_db', $this->_db);
      }

      public function _initMemcached(Yaf_Dispatcher $dispatcher){
         $this->_mc = new memcached();
         $mc_server = $this->_config->memcached;
         $this->_mc->addServer($mc_server['host'], $mc_server['port']);
         Yaf_Registry::set('_mc', $this->_mc);
         //$this->_mc->set("y","yangzhi");
         //echo $this->_mc->get("y");
      }
   }