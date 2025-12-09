<script>
	import { onMount } from "svelte";
    import { marked } from 'marked';
	import { LinkHandler } from "$lib/utils/linkhandler.svelte";
    let {projectName,projectIndex,collapseChange}  = $props();

    let project = $state("")
    let type = $state("")
    let date = $state("")
    let description = $state("")
    let technologies = $state("")
    let collaborators = $state("")
    let documentation = $state("")
    let demo = $state("")
    let expanded = $state(true)
	let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
	$effect(() => {
		if (collapseChange) {
			expanded = false;
		}else{
			expanded = true;
		}
	});
    onMount(async () => {
        let response = await fetch(LinkHandler(`/media/${projectName}/text.md`))
        let content = await response.text();
        let parts = content.split('---').map(item => item.trim());
        project = parts[0];
        type = parts[1];
        date = parts[2];
        description = marked.parse(parts[3]);
        technologies = JSON.parse(parts[4]) ?? [];
        collaborators = JSON.parse(parts[5])?? [];
        documentation = JSON.parse(parts[6]) ?? [];
        demo = JSON.parse(parts[7])?? [];
    })
</script>

<div class="grid-8 relative mb-4 bg-background">
	<div
		class="row-start-1 hidden md:hidden bg-background z-4 sticky top-0"
		class:h-16={expanded}
		class:-mt-16={expanded}
		class:block={expanded}
	></div>
	<div class="col-span-2 md:col-span-1 z-12 sticky top-16 bg-background" class:h-full={expanded}>
		<h3 class="text-accent">{type}</h3>
		<h3 >{new Date(date).getFullYear()}-{months[new Date(date).getMonth()]}</h3>
		<div  class="w-1/6 h-1/2 border-r border-dotted mt-2" class:hidden={expanded}></div>
	</div>
	<button
		
		onclick={() => (expanded = !expanded)}
		class="collapse-button col-span-6 md:col-span-7 grid-8 cursor-pointer z-12 sticky top-16"
		class:pb-4={expanded}
		class:border-b={expanded}
		class:border-dotted={expanded}
		class:bg-background={expanded}
	>
		<div class="col-span-7 grid grid-cols-[20px_auto]">
			<h1 class="col-span-2">{project}</h1>
			<div class="col-span-2 flex gap-2 items-center mt-2">
				{#each demo as link}
					<a
						href={LinkHandler(link.url)}
						class="text-black font-serif no-underline w-max border px-2 py-px hover:border-dotted transition flex gap-1 items-center"
						target="_blank"
						rel="noopener noreferrer"><img class="h-3" src={LinkHandler("/icons/link.svg")} alt="link icon"> {link.name} </a
					>
				{/each}
			</div>
		</div>
		<div
			class="col-span-1 row-span-1 w-3 h-3 border bg-background transition-all mt-2"
			class:rotate-45={expanded}
			class:bg-black={expanded}
		></div>
	</button>
	<div class="h-0 col-span-8 grid-8 gap-6 md:gap-4 overflow-hidden" class:h-full={expanded}>
		<div class="col-start-1 col-span-8 md:col-start-2 md:col-span-5 grid grid-cols-[20px_auto]">
			<p class="col-start-1 col-span-2 md:col-start-2 md:mt-0 mt-4">
				{@html description}
			</p>
		</div>
		<div class="col-span-8 md:col-start-7 md:col-span-1">
			<div class="flex md:flex-col gap-2 mb-2">
				{#each technologies as tech}
					<div class="flex gap-2 px-2 py-1 items-center">
						<img
							src={LinkHandler(`/icons/${tech.icon}.svg`)}
							alt={tech.name}
							class="w-6 h-6"
							loading="lazy"
						/>
						<p class="">{tech.name}</p>
					</div>
				{/each}
			</div>
		</div>
		<div class="col-span-8 md:col-start-2 md:col-span-7">
			<div
				class="h-0 overflow-hidden grid md:grid-cols-2"
				class:-mt-2={!expanded}
				class:h-full={expanded}
			>
				{#each documentation as doc}
					<img
						src={LinkHandler(doc)}
						alt="Documentation image"
						class="my-4 w-full"
						loading="lazy"
					/>
				{/each}
			</div>
		</div>
	</div>
</div>
