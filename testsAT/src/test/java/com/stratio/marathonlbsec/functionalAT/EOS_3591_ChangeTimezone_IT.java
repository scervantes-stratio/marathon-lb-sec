package com.stratio.marathonlbsec.functionalAT;

import com.stratio.qa.cucumber.testng.CucumberFeatureWrapper;
import com.stratio.qa.cucumber.testng.PickleEventWrapper;
import com.stratio.qa.utils.BaseGTest;
import cucumber.api.CucumberOptions;
import org.testng.annotations.Test;

@CucumberOptions(features = {
        "src/test/resources/features/functionalAT/030_Logs/01_MARATHONLB_1388_CentralizedLogs.feature",
},plugin = "json:target/cucumber.json")
public class EOS_3591_ChangeTimezone_IT extends BaseGTest {

    public EOS_3591_ChangeTimezone_IT() {}

    @Test(enabled = true, groups = {"changeTimezone"}, dataProvider = "scenarios")
    public void EOS3591_changeTimezone(PickleEventWrapper pickleWrapper, CucumberFeatureWrapper featureWrapper) throws Throwable {
        runScenario(pickleWrapper, featureWrapper);
    }
}
