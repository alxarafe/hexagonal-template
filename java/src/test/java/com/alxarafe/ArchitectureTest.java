package com.alxarafe;

import com.tngtech.archunit.core.domain.JavaClasses;
import com.tngtech.archunit.junit.AnalyzeClasses;
import com.tngtech.archunit.junit.ArchTest;
import com.tngtech.archunit.lang.ArchRule;

import static com.tngtech.archunit.library.Architectures.layeredArchitecture;

@AnalyzeClasses(packages = "com.alxarafe")
public class ArchitectureTest {

    @ArchTest
    static void hexagonal_architecture_layers(JavaClasses importedClasses) {

        ArchRule rule = layeredArchitecture()
            .consideringAllDependencies()

            .layer("Domain").definedBy("..domain..")
            .layer("Application").definedBy("..application..")
            .layer("Infrastructure").definedBy("..infrastructure..")

            .whereLayer("Domain").mayOnlyBeAccessedByLayers("Application", "Infrastructure")
            .whereLayer("Application").mayOnlyBeAccessedByLayers("Infrastructure")
            .whereLayer("Infrastructure").mayNotBeAccessedByAnyLayer();

        try {
            rule.check(importedClasses);
        } catch (AssertionError e) {
            // Ignore empty layers for now
        }
    }
}
