<script>
	import { onMount } from "svelte";
    import { marked } from 'marked';
	import { LinkHandler } from "$lib/utils/linkhandler.svelte";
    let {projectName}  = $props();

    let project = $state("")
    let type = $state("")
    let date = $state("")
    let description = $state("")
    let technologies = $state("")
    let collaborators = $state("")
    let documentation = $state("")
    let demo = $state("")
    let documentationOpen = $state(true)
    let expanded = $state(false)

    onMount(async () => {
        let response = await fetch(LinkHandler(`/media/${projectName}/text.md`))
        let content = await response.text();
        let parts = content.split('---').map(item => item.trim());
        project = parts[0];
        type = parts[1];
        date = parts[2];
        description = marked.parse(parts[3]);
        technologies = JSON.parse(parts[4]);
        collaborators = JSON.parse(parts[5]);
        documentation = JSON.parse(parts[6]);
        demo = JSON.parse(parts[7])
    })
</script>

<div class="grid grid-cols-6 transition-all my-4">
    <div class="row-start-1 h-16 -mt-16 md:hidden bg-background z-4 sticky top-0"></div>
	<button onclick={() => (expanded = !expanded)} class="z-5 border text-left px-4 bg-card-background border-card-border col-start-1 col-span-6 md:col-start-2 md:col-span-5 grid grid-cols-3 bg-background py-4 sticky top-0">
        <div class="col-start-1 col-span-3 row-start-1">    
			<h1>{project}</h1>
			<h2>{type}</h2>
		</div>
        <div class="col-start-3 col-span-1 row-start-1 flex justify-end items-center" >
            <img src={LinkHandler("/icons/ui-scroll.svg")} class="w-6 h-6 transition-transform" alt="" class:rotate-180={expanded}>
        </div>
	</button>
	<div class="h-0 col-span-6 grid grid-cols-6  overflow-hidden" class:h-full={expanded}>
		<div class="col-start-1 col-span-6 md:col-start-2 md:col-span-4 p-4 bg-card-background border border-card-border">
			<div>
				<h3>Context</h3>
				<p class="mt-2">
					{@html description}
				</p>
			</div>
		</div>
		<div
			class="col-start-1 col-span-6 md:col-start-6 md:col-span-1 flex md:flex-col flex-wrap gap-2 p-4 bg-card-background border border-card-border"
		>
			{#each technologies as tech}
				<div class="flex gap-2 px-2 py-1 items-center">
					<img src={LinkHandler(`/icons/${tech.icon}.svg`)} alt={tech.name} class="w-6 h-6" loading="lazy" />
					<p class="">{tech.name}</p>
				</div>
			{/each}
			{#each demo as link}
				<p
					class="w-max border border-border px-4 py-1 rounded-full hover:bg-accent hover:text-black transition"
				>
					<a
						href={LinkHandler(link.url)}
						class="text-black no-underline"
						target="_blank"
						rel="noopener noreferrer">{link.name}</a
					>
				</p>
			{/each}
		</div>
		<button
			onclick={() => (documentationOpen = !documentationOpen)}
			class="col-start-1 col-span-6 md:col-start-2 md:col-span-5 flex flex-col gap-2 p-4 bg-card-background border border-card-border"
		>
			<div class="text-left">
				<h3>Documentation</h3>
			</div>
			<div
				class="h-0 overflow-hidden"
				class:-mt-2={!documentationOpen}
				class:h-full={documentationOpen}
			>
                {#each documentation as doc}
                    <img src={LinkHandler(doc)} alt="Documentation image" class="my-4 w-full" loading="lazy"/>
                {/each}
			</div>
		</button>
	</div>
</div>
