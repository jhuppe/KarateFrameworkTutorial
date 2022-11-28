package com.api.automation;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner.Builder;

public class ParallelRunner {
	
	@Test
	public void executeKarateTests() {
		Builder aRunner = new Builder();
		aRunner.path("classpath:com/api/automation").parallel(5);
	}
}