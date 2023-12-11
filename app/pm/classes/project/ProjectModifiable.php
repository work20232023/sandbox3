<?php
include "ProjectModifiableRegistry.php";

class ProjectModifiable extends Project
{
	function __construct() {
		parent::__construct(new ProjectModifiableRegistry());
	}
}