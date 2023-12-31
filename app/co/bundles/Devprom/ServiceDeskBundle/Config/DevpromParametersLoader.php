<?php

namespace Devprom\ServiceDeskBundle\Config;

use DAL;
use DALMySQLi;
use Devprom\ServiceDeskBundle\Util\TextUtil;
use MySQLConnectionInfo;

/**
 * @author Kosta Korenkov <7r0ggy@gmail.com>
 */
class DevpromParametersLoader {

    public function loadSystemSettings()
    {
        $params = array();
        $params['DB_HOST'] = DB_HOST;
        $params['DB_USER'] = DB_USER;
        $params['DB_PASS'] = DB_PASS;
        $params['DB_NAME'] = DB_NAME;
        $params['APP_CHARSET'] = APP_CHARSET;

        $settings = $this->queryDevpromSettings();

        $params['systemLanguage'] = $settings['langCode'];
        $params['adminEmail'] = $settings['adminEmail'];
        $clientName = mb_convert_encoding($settings['clientName'], 'utf-8', APP_ENCODING);
        $params['supportName'] = sprintf("%s Support", TextUtil::unescapeHtml($clientName));

        return $params;
    }
    
    public function loadProjectSettings()
    {
    	$data = $this->queryProjectSettings();
        $settings['supportProjects'] = $data['supportProjects'];
        $settings['supportProjectVpds'] = $data['supportProjectVpds'];
        $settings['commonProjectVpds'] = $data['commonProjectVpds'];
        $settings['publicKBProjectVpds'] = $data['publicKBProjectVpds'];
        return $settings;
    }

    /**
     * @return array
     */
    protected function queryDevpromSettings()
    {
    	if (!\DeploymentState::IsInstalled()) return array();
        DALMySQLi::Instance()->Connect(new MySQLConnectionInfo(DB_HOST, DB_NAME, DB_USER, DB_PASS));
        $sql = "SELECT LOWER(l.CodeName) langCode, IFNULL(AdminEmail, ' ') adminEmail, s.Caption clientName
                    FROM cms_SystemSettings s, cms_Language l
                    WHERE s.LANGUAGE = l.cms_languageId";
        return DAL::Instance()->QueryAssocArray($sql);
    }

    protected function queryProjectSettings()
    {
    	if (!\DeploymentState::IsInstalled()) return array();
        DALMySQLi::Instance()->Connect(new MySQLConnectionInfo(DB_HOST, DB_NAME, DB_USER, DB_PASS));
        $sql = "SELECT p.pm_ProjectId, p.VPD, 
                       (SELECT COUNT(1) FROM co_CompanyProject cp, co_Company c WHERE c.co_CompanyId = cp.Company AND cp.Project = p.pm_ProjectId) Companies,
                       p.KnowledgeBaseAuthorizedAccess
                  FROM pm_Project p
        		 WHERE EXISTS (SELECT 1 FROM pm_Methodology m WHERE m.IsSupportUsed = 'Y' AND m.Project = p.pm_ProjectId) 
        		   AND p.IsClosed = 'N'
        		";
        $r2 = DAL::Instance()->Query($sql);
        $result = array(
            'supportProjects' => array(),
            'supportProjectVpds' => array(),
            'commonProjectVpds' => array(),
            'publicKBProjectVpds' => array()
        );
        while($data = DAL::Instance()->QueryAssocArray($r2)) {
            $result['supportProjects'][] = $data['pm_ProjectId'];
            $result['supportProjectVpds'][] = $data['VPD'];
            if ( $data['Companies'] < 1 ) {
                $result['commonProjectVpds'][] = $data['VPD'];
            }
            if ( $data['KnowledgeBaseAuthorizedAccess'] != 'Y' ) {
                $result['publicKBProjectVpds'][] = $data['VPD'];
            }
        }
        return $result;
    }
}