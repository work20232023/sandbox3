<?php
include_once SERVER_ROOT_PATH."core/methods/WebMethod.php";

class UnBlockUserWebMethod extends WebMethod
{
    function getCaption() {
        return translate('Разблокировать');
    }

    function execute( $parms )
    {
        if ( !$this->hasAccess() ) return;

        $user_it = getFactory()->getObject('User')->getExact($parms['user']);
        if ( $user_it->getId() == '' ) return;

        $list = getFactory()->getObject('BlackList');
        $list_it = $list->getByRef('SystemUser', $user_it->getId());

        while( !$list_it->end() ) {
            $list->delete($list_it->getId());
            $list_it->moveNext();
        }

        getFactory()->modifyEntity($user_it, array(
            'IsReadonly' => $user_it->object->getDefaultAttributeValue('IsReadonly')
        ));

        $list = new Metaobject('cms_LoginRetry');
        $list_it = $list->getByRef('SystemUser', $parms['user']);

        while( !$list_it->end() ) {
            $list->delete($list_it->getId());
            $list_it->moveNext();
        }
    }

    function hasAccess() {
        return getSession()->getUserIt()->IsAdministrator();
    }

    function execute_request()
    {
        global $_REQUEST;
        $this->execute( $_REQUEST );
    }
}
